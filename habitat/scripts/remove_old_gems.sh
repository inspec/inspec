#!/bin/bash
# Removes outdated gems bundled with the Ruby Habitat package and installs updated versions.
# Called from do_install() in plan.sh.

RUBY_GEMS_PATH="$(pkg_path_for $ruby_package)/lib/ruby/gems"

# Gems whose Gemfile.lock should be removed (not used at runtime)
GEMFILE_LOCK_GEMS=(lint_roller rbs)

# Gems to replace with updated versions: "name:version"
GEMS_TO_UPDATE=(rexml:3.4.2)

for gem in "${GEMFILE_LOCK_GEMS[@]}"; do
  find "$GEM_HOME/gems" "$RUBY_GEMS_PATH" \
    -path "*/gems/${gem}-*/Gemfile.lock" -delete 2>/dev/null || true
done

for entry in "${GEMS_TO_UPDATE[@]}"; do
  gem_name="${entry%%:*}"
  gem_version="${entry##*:}"

  find "$RUBY_GEMS_PATH" \
    -name "${gem_name}-*.gemspec" ! -name "${gem_name}-${gem_version}.gemspec" \
    -delete 2>/dev/null || true

  find "$RUBY_GEMS_PATH" -maxdepth 3 -type d \
    -name "${gem_name}-*" ! -name "${gem_name}-${gem_version}" \
    -exec rm -rf {} + 2>/dev/null || true

  gem install "${gem_name}" -v "${gem_version}" --no-document
done
