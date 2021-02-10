+++
title = "google_cloudbuild_trigger resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_cloudbuild_trigger"
    identifier = "inspec/resources/gcp/google_cloudbuild_trigger.md google_cloudbuild_trigger resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_cloudbuild_trigger` is used to test a Google Trigger resource

## Examples

```ruby
describe google_cloudbuild_triggers(project: 'chef-gcp-inspec') do
  its('count') { should eq 1 }
end

google_cloudbuild_triggers(project: 'chef-gcp-inspec').ids.each do |id|
  describe google_cloudbuild_trigger(project: 'chef-gcp-inspec', id: id) do
    its('filename') { should eq 'cloudbuild.yaml' }
    its('trigger_template.branch_name') { should eq 'trigger-branch' }
    its('trigger_template.repo_name') { should eq 'trigger-repo' }
    its('trigger_template.project_id') { should eq 'trigger-project' }
  end
end
```

## Properties

Properties that can be accessed from the `google_cloudbuild_trigger` resource:

`id`
: The unique identifier for the trigger.

`name`
: Name of the trigger. Must be unique within the project.

`description`
: Human-readable description of the trigger.

`disabled`
: Whether the trigger is disabled or not. If true, the trigger will never result in a build.

`create_time`
: Time when the trigger was created.

`substitutions`
: Substitutions data for Build resource.

`filename`
: Path, from the source root, to a file whose contents is used for the template. Either a filename or build template must be provided.

`ignored_files`
: ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`. If ignoredFiles and changed files are both empty, then they are not used to determine whether or not to trigger a build. If ignoredFiles is not empty, then we ignore any files that match any of the ignored_file globs. If the change has no files that are outside of the ignoredFiles globs, then we do not trigger a build.

`included_files`
: ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`. If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is empty, then as far as this filter is concerned, we should trigger the build. If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is not empty, then we make sure that at least one of those files matches a includedFiles glob. If not, then we do not trigger a build.

`trigger_template`
: Template describing the types of source changes to trigger a build. Branch and tag names in trigger templates are interpreted as regular expressions. Any branch or tag change that matches that regular expression will trigger a build.

  `project_id`
  : ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.

  `repo_name`
  : Name of the Cloud Source Repository. If omitted, the name "default" is assumed.

  `dir`
  : Directory, relative to the source root, in which to run the build.  This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution.

  `branch_name`
  : Name of the branch to build. Exactly one a of branch name, tag, or commit SHA must be provided. This field is a regular expression.

  `tag_name`
  : Name of the tag to build. Exactly one of a branch name, tag, or commit SHA must be provided. This field is a regular expression.

  `commit_sha`
  : Explicit commit SHA to build. Exactly one of a branch name, tag, or commit SHA must be provided.

`github`
: (Beta only) Describes the configuration of a trigger that creates a build whenever a GitHub event is received.

  `owner`
  : Owner of the repository. For example: The owner for https://github.com/googlecloudplatform/cloud-builders is "googlecloudplatform".

  `name`
  : Name of the repository. For example: The name for https://github.com/googlecloudplatform/cloud-builders is "cloud-builders".

  `pull_request`
  : filter to match changes in pull requests.  Specify only one of pullRequest or push.

    `branch`
    : Regex of branches to match.

    `comment_control`
    : Whether to block builds on a "/gcbrun" comment from a repository owner or collaborator.

      Possible values:

      - COMMENTS_DISABLED
      - COMMENTS_ENABLED

  `push`
  : filter to match changes in refs, like branches or tags.  Specify only one of pullRequest or push.

    `branch`
    : Regex of branches to match.  Specify only one of branch or tag.

    `tag`
    : Regex of tags to match.  Specify only one of branch or tag.

`build`
: Contents of the build template. Either a filename or build template must be provided.

  `tags`
  : Tags for annotation of a Build. These are not docker tags.

  `images`
  : A list of images to be pushed upon the successful completion of all build steps. The images are pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build status is marked FAILURE.

  `timeout`
  : Amount of time that this build should be allowed to run, to second granularity. If this amount of time elapses, work on the build will cease and the build status will be TIMEOUT. This timeout must be equal to or greater than the sum of the timeouts for build steps within the build. The expected format is the number of seconds followed by s. Default time is ten minutes (600s).

  `steps`
  : The operations to be performed on the workspace.

    `name`
    : The name of the container image that will run this particular build step.  If the image is available in the host's Docker daemon's cache, it will be run directly. If not, the host will attempt to pull the image first, using the builder service account's credentials if necessary.  The Docker daemon's cache will already have the latest versions of all of the officially supported build steps (https://github.com/GoogleCloudPlatform/cloud-builders). The Docker daemon will also have cached many of the layers for some popular images, like "ubuntu", "debian", but they will be refreshed at the time you attempt to use them.  If you built an image in a previous build step, it will be stored in the host's Docker daemon's cache and is available to use as the name for a later build step.

    `args`
    : A list of arguments that will be presented to the step when it is started.  If the image used to run the step's container has an entrypoint, the args are used as arguments to that entrypoint. If the image does not define an entrypoint, the first element in args is used as the entrypoint, and the remainder will be used as arguments.

    `env`
    : A list of environment variable definitions to be used when running a step.  The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".

    `id`
    : Unique identifier for this build step, used in `wait_for` to reference this build step as a dependency.

    `entrypoint`
    : Entrypoint to be used instead of the build step image's default entrypoint. If unset, the image's default entrypoint is used

    `dir`
    : Working directory to use when running this step's container.  If this value is a relative path, it is relative to the build's working directory. If this value is absolute, it may be outside the build's working directory, in which case the contents of the path may not be persisted across build step executions, unless a `volume` for that path is specified.  If the build specifies a `RepoSource` with `dir` and a step with a `dir`, which specifies an absolute path, the `RepoSource` `dir` is ignored for the step's execution.

    `secret_env`
    : A list of environment variables which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's `Secret`.

    `timeout`
    : Time limit for executing this build step. If not defined, the step has no time limit and will be allowed to continue to run until either it completes or the build itself times out.

    `timing`
    : Output only. Stores timing information for executing this build step.

    `volumes`
    : List of volumes to mount into the build step.  Each volume is created as an empty volume prior to execution of the build step. Upon completion of the build, volumes and their contents are discarded.  Using a named volume in only one step is not valid as it is indicative of a build request with an incorrect configuration.

      `name`
      : Name of the volume to mount.  Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps.

      `path`
      : Path at which to mount the volume.  Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths.

    `wait_for`
    : The ID(s) of the step(s) that this build step depends on.  This build step will not start until all the build steps in `wait_for` have completed successfully. If `wait_for` is empty, this build step will start when all previous build steps in the `Build.Steps` list have completed successfully.

## GCP Permissions

Ensure the [Cloud Build API](https://console.cloud.google.com/apis/library/cloudbuild.googleapis.com/) is enabled for the current project.
