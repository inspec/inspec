---
title: About the google_cloudbuild_trigger resource
platform: gcp
---

## Syntax
A `google_cloudbuild_trigger` is used to test a Google Trigger resource

## Examples
```
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

  * `id`: The unique identifier for the trigger.

  * `description`: Human-readable description of the trigger.

  * `disabled`: Whether the trigger is disabled or not. If true, the trigger will never result in a build.

  * `create_time`: Time when the trigger was created.

  * `substitutions`: Substitutions data for Build resource.

  * `filename`: Path, from the source root, to a file whose contents is used for the template.

  * `ignored_files`: ignoredFiles and includedFiles are file glob matches using http://godoc/pkg/path/filepath#Match extended with support for `**`.  If ignoredFiles and changed files are both empty, then they are not used to determine whether or not to trigger a build.  If ignoredFiles is not empty, then we ignore any files that match any of the ignored_file globs. If the change has no files that are outside of the ignoredFiles globs, then we do not trigger a build.

  * `included_files`: ignoredFiles and includedFiles are file glob matches using http://godoc/pkg/path/filepath#Match extended with support for `**`.  If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is empty, then as far as this filter is concerned, we should trigger the build.  If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is not empty, then we make sure that at least one of those files matches a includedFiles glob. If not, then we do not trigger a build.

  * `trigger_template`: Template describing the types of source changes to trigger a build.  Branch and tag names in trigger templates are interpreted as regular expressions. Any branch or tag change that matches that regular expression will trigger a build.

    * `projectId`: ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.

    * `repoName`: Name of the Cloud Source Repository. If omitted, the name "default" is assumed.

    * `dir`: Directory, relative to the source root, in which to run the build.  This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution.

    * `branchName`: Name of the branch to build.

    * `tagName`: Name of the tag to build.

    * `commitSha`: Explicit commit SHA to build.

  * `build`: Contents of the build template.

    * `tags`: Tags for annotation of a Build. These are not docker tags.

    * `images`: A list of images to be pushed upon the successful completion of all build steps. The images are pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build status is marked FAILURE.

    * `steps`: The operations to be performed on the workspace.
