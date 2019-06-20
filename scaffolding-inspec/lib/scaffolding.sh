#
# A scaffolding for an InSpec Profile
#

scaffolding_load() {
  pkg_deps=(
    "${pkg_deps[@]}"
    "chef/inspec"
  )
  pkg_build_deps=(
    "${pkg_build_deps[@]}"
    "chef/inspec"
    "core/jq-static"
  )
  pkg_svc_user="root"
  pkg_svc_run="set_just_so_you_will_render"
}

do_default_before() {
  if [ ! -f "$PLAN_CONTEXT/../inspec.yml" ]; then
    message="ERROR: Cannot find inspec.yml."
    message="$message Please build from the profile root"
    build_line "$message"

    return 1
  fi

  # Execute an 'inspec compliance login' if a profile needs to be fetched from
  # the Automate server
  if [ "$(grep "compliance: " "$PLAN_CONTEXT/../inspec.yml")" ]; then
    _do_compliance_login;
  fi
}

do_default_setup_environment() {
  set_buildtime_env PROFILE_CACHE_DIR "$HAB_CACHE_SRC_PATH/$pkg_dirname"
  set_buildtime_env ARCHIVE_NAME "$pkg_name-$pkg_version.tar.gz"

  # InSpec loads `pry` which tries to expand `~`. This fails if HOME isn't set.
  set_runtime_env HOME "$pkg_svc_var_path"

  # InSpec will create a `.inspec` directory in the user's home directory.
  # This overrides that to write to a place within the running service's path.
  # NOTE: Setting HOME does the same currently. This is here to be explicit.
  set_runtime_env INSPEC_CONFIG_DIR  "$pkg_svc_var_path"
}

do_default_unpack() {
  # Change directory to where the profile files are
  pushd "$PLAN_CONTEXT/../" > /dev/null

  # Get a list of all files in the profile except those that are Habitat related
  profile_files=($(ls -I habitat -I results -I "*.hart"))

  mkdir -p "$HAB_CACHE_SRC_PATH/$pkg_dirname" > /dev/null

  # Copy just the profile files to the profile cache directory
  cp -r ${profile_files[@]} "$HAB_CACHE_SRC_PATH/$pkg_dirname"
}

do_default_build_service() {
  ## Create Hooks
  mkdir -p "$pkg_prefix/hooks"
  chmod 0750 "$pkg_prefix/hooks"

  # Run hook
  cat << EOF >> "$pkg_prefix/hooks/run"
#!/bin/sh

export HOME="{{pkg.svc_var_path}}"
export INSPEC_CONFIG_DIR="{{pkg.svc_var_path}}"

CFG_SPLAY_FIRST_RUN={{cfg.splay_first_run}}
CFG_SPLAY_FIRST_RUN="\${CFG_SPLAY_FIRST_RUN:-0}"
CFG_INTERVAL={{cfg.interval}}
CFG_INTERVAL="\${CFG_INTERVAL:-300}"
CFG_SPLAY={{cfg.splay}}
CFG_SPLAY="\${CFG_SPLAY:-300}"
CFG_LOG_LEVEL={{cfg.log_level}}
CFG_LOG_LEVEL="\${CFG_LOG_LEVEL:-warn}"
CFG_CHEF_LICENSE={{cfg.chef_license.acceptance}}
CFG_CHEF_LICENSE="\${CFG_CHEF_LICENSE:-undefined}"
CONFIG="{{pkg.svc_config_path}}/inspec_exec_config.json"
PROFILE_PATH="{{pkg.path}}/{{pkg.name}}-{{pkg.version}}.tar.gz"

inspec_cmd()
{
  inspec exec \${PROFILE_PATH} --json-config \${CONFIG} --chef-license \$CFG_CHEF_LICENSE --log-level \$CFG_LOG_LEVEL
}


SPLAY_DURATION=\$(shuf -i 0-\$CFG_SPLAY -n 1)
SPLAY_FIRST_RUN_DURATION=\$(shuf -i 0-\$CFG_SPLAY_FIRST_RUN -n 1)

exec 2>&1
sleep \$SPLAY_FIRST_RUN_DURATION
inspec_cmd

while true; do
  SLEEP_TIME=\$((\$SPLAY_DURATION + \$CFG_INTERVAL))
  echo "InSpec is sleeping for \$SLEEP_TIME seconds"
  sleep \$SPLAY_DURATION
  sleep \$CFG_INTERVAL
  inspec_cmd
done
EOF
  chmod 0750 "$pkg_prefix/hooks/run"
}

do_default_build() {
  inspec archive "$HAB_CACHE_SRC_PATH/$pkg_dirname" \
                 --overwrite \
                 -o "$HAB_CACHE_SRC_PATH/$pkg_dirname/$pkg_name-$pkg_version.tar.gz" \
                 --chef-license "$CHEF_LICENSE"
}

do_default_install() {
  cp "$HAB_CACHE_SRC_PATH/$pkg_dirname/$pkg_name-$pkg_version.tar.gz" "$pkg_prefix"

  mkdir -p "$pkg_prefix/config"
  chmod 0750 "$pkg_prefix/config"
  cat << EOF >> "$pkg_prefix/config/cli_only.json"
{
    "reporter": {
        "cli" : {
            "stdout" : true
        }
    }
}
EOF
  chmod 0640 "$pkg_prefix/config/cli_only.json"

  cat << EOF >> "$pkg_prefix/config/inspec_exec_config.json"
{
    "target_id": "{{ sys.member_id }}",
    "reporter": {
      "cli": {
        "stdout": {{cfg.report_to_stdout}}
      },
      "json": {
        "file": "{{pkg.svc_path}}/logs/inspec_last_run.json"
      }{{#if cfg.automate.token ~}},
      "automate" : {
        "url": "{{cfg.automate.url}}/data-collector/v0/",
        "token": "{{cfg.automate.token}}",
        "node_name": "{{ sys.hostname }}",
        "verify_ssl": false
      }{{/if ~}}
    }
    {{#if cfg.automate.token }},
    "compliance": {
     "server" : "{{cfg.automate.url}}",
     "token" : "{{cfg.automate.token}}",
     "user" : "{{cfg.automate.user}}",
     "insecure" : true,
     "ent" : "automate"
    }{{/if }}
}
EOF
  chmod 0640 "$pkg_prefix/config/inspec_exec_config.json"

  cat << EOF >> "$pkg_prefix/default.toml"
interval = 300
splay = 300
splay_first_run = 0
log_level = 'warn'
report_to_stdout = true

[chef_license]
acceptance = "undefined"

# Uncomment and replace values to report to Automate.
# This can also be applied at runtime via `hab config apply`
# [automate]
# url = 'https://<automate_url>'
# token = '<automate_token>'
# user = '<automate_user>'
EOF
  chmod 0640 "$pkg_prefix/default.toml"
}

do_default_strip() {
  return 0
}

_do_compliance_login() {
  if [ -z $COMPLIANCE_CREDS ]; then
    message="ERROR: Please perform an 'inspec compliance login' and set"
    message="$message \$HAB_STUDIO_SECRET_COMPLIANCE_CREDS to the contents of"
    message="$message '~/.inspec/compliance/config.json'"
    build_line "$message"
    return 1
  fi

  user=$(echo $COMPLIANCE_CREDS | jq .user | sed 's/"//g')
  token=$(echo $COMPLIANCE_CREDS | jq .token | sed 's/"//g')
  automate_server=$(echo $COMPLIANCE_CREDS | \
                    jq .server | \
                    sed 's/\/api\/v0//' | \
                    sed 's/"//g'
                   )
  insecure=$(echo $COMPLIANCE_CREDS | jq .insecure)
  inspec compliance login --insecure $insecure \
                          --user $user \
                          --token $token \
                          --chef-license "$CHEF_LICENSE" \
                          $automate_server
                          
}