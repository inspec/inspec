# GitHub Copilot Instructions for InSpec

## Project Overview

InSpec is an open-source infrastructure testing framework written in Ruby. It provides a domain-specific language (DSL) for describing security and compliance rules that can be shared between software engineers, operations, and security engineers.

## Repository Structure

The InSpec repository is organized as follows:

```
inspec/
├── .github/                    # GitHub configurations and workflows
├── contrib/                    # Contribution guidelines and configs
├── coverage/                   # Test coverage reports
├── dev-docs/                   # Developer documentation
├── docs-chef-io/              # Chef.io documentation
├── etc/                        # Configuration files (deprecations, features, etc.)
├── examples/                   # Example profiles and usage demos
├── habitat/                    # Habitat packaging configuration
├── lib/                        # Main source code
│   ├── inspec/                # Core InSpec functionality
│   │   ├── resources/         # InSpec resource implementations
│   │   ├── formatters/        # Output formatters
│   │   ├── reporters/         # Result reporters
│   │   ├── plugin/            # Plugin system
│   │   ├── fetcher/           # Profile fetchers
│   │   └── ...               # Other core modules
│   └── bundles/               # Bundle definitions
├── test/                       # Test suites
│   ├── unit/                  # Unit tests
│   ├── integration/           # Integration tests
│   ├── functional/            # Functional tests
│   └── fixtures/              # Test fixtures
├── inspec-bin/                # CLI binary gem
├── omnibus/                   # Omnibus packaging
├── support/                   # Support files and scripts
├── tasks/                     # Rake tasks
├── inspec.gemspec            # Main gem specification
├── inspec-core.gemspec       # Core gem specification
└── VERSION                   # Version file
```

## Architecture

This is a **multi-gem Ruby project** with the following structure:

- **inspec** - Main framework gem (inspec.gemspec)
- **inspec-core** - Core functionality without CLI (inspec-core.gemspec)  
- **inspec-bin** - Command-line interface (inspec-bin/inspec-bin.gemspec)
- **inspec-core-bin** - Alternative CLI distribution

## Key Development Patterns

### CLI Option Management

CLI options in InSpec are defined across multiple locations using the Thor framework:

**1. Base CLI Options (`lib/inspec/base_cli.rb`)**
- Contains shared option groups used across commands:
  - `target_options` - Remote connection settings (WinRM, SSH, etc.)
  - `profile_options` - Profile-related settings
  - `exec_options` - Execution configuration
  - `audit_log_options` - Audit logging settings

```ruby
def self.target_options
  option :target, aliases: :t, type: :string,
    desc: "Simple targeting option using URIs"
  option :backend, aliases: :b, type: :string,
    desc: "Choose a backend: local, ssh, winrm, docker"
  option :winrm_transport, type: :string, default: "negotiate",
    desc: "Specify which transport to use (WinRM)"
  # ... more options
end
```

**2. Main CLI Options (`lib/inspec/cli.rb`)**
- Global class options available to all commands:
  - `--log-level`, `--log-location` - Logging configuration
  - `--diagnose` - Diagnostic output
  - `--color` - Output formatting
  - `--disable-core-plugins`, `--disable-user-plugins` - Plugin control

**3. Command-Specific Options (`lib/inspec/cli.rb`)**
- Options defined directly above individual command methods:
```ruby
option :inspect, type: :boolean, default: false, desc: "Use verbose/debugging output for resources."
def exec(targets = nil)
  # Command implementation
end
```

**4. Plugin-Defined Options**
- Plugins in `lib/plugins/` define their own CLI options:
  - **inspec-compliance**: Defines options for Automate integration (`--insecure`, `--token`, etc.)
  - **inspec-parallel**: Defines options for parallel execution (`--jobs`, `--dry-run`, etc.)

```ruby
# Plugin CLI example
class CLI < Inspec.plugin(2, :cli_command)
  option :insecure, aliases: :k, type: :boolean,
    desc: 'Explicitly allows InSpec to perform "insecure" SSL connections'
  option :jobs, aliases: :j, type: :numeric,
    desc: "Number of jobs to run parallely"
end
```

### Transport Layer Integration

InSpec uses the Train library for remote connections. Transport options flow from CLI → Config → Train → specific transport plugins (train-winrm, train-ssh, etc.).

### Resource Development

InSpec resources are located in `lib/inspec/resources/` and follow this pattern:

```ruby
require "inspec/resource"

module Inspec::Resources
  class MyResource < Inspec.resource(1)
    name "my_resource"
    supports platform: "unix"
    
    desc "Description of the resource"
    example "
      describe my_resource do
        it { should exist }
      end
    "
    
    def exist?
      # Implementation
    end
  end
end
```

### Licensing System

InSpec integrates with Chef's licensing system for commercial features and entitlements. The licensing logic is distributed across several key files:

**1. Core Licensing Configuration (`lib/inspec/utils/licensing_config.rb`)**
- Configures ChefLicensing with InSpec-specific settings
- Sets entitlement ID and licensing server URL
- Handles Kitchen/Test Kitchen specific licensing configuration

```ruby
ChefLicensing.configure do |config|
  config.chef_product_name = "InSpec"
  config.chef_executable_name = "inspec"
  # Can add more additional configuration
end
```

**2. CLI Integration (`lib/inspec/base_cli.rb`)**
- Handles license checking at CLI command initialization
- Calls `check_license!` and `fetch_and_persist_license` methods
- Integrates licensing validation into command execution flow

**3. Runner Integration (`lib/inspec/runner.rb`)**
- Validates software entitlements during profile execution
- Configures licensing for Kitchen integration scenarios
- Handles license persistence when passed via test-kitchen

**4. Shell Integration (`lib/inspec/shell.rb`)**
- Performs license entitlement checks for interactive shell sessions
- Handles licensing errors and exits gracefully with appropriate codes

**5. License Plugin (`lib/plugins/inspec-license/`)**
- Provides CLI commands for license management: `inspec license list`, `inspec license add`
- Handles license-specific operations and error handling
- Integrates with Chef Licensing service APIs

**Key Licensing Patterns:**
- Always check entitlements before executing core functionality
- Handle licensing errors gracefully with proper exit codes
- Support both local and remote licensing scenarios
- Configure different entitlement IDs for different execution contexts (standalone vs Kitchen)

## Code Style Guidelines

### Ruby Version Compatibility

The project supports multiple Ruby versions with conditional dependencies:

```ruby
# In Gemfile - version-specific constraints
if RUBY_VERSION < "3.1.0"
  gem "dry-types", "<= 1.7.2"
  gem "dry-core", "> 1.0.0", "< 1.1.0"
end
```

### String Literals and Frozen Strings

Files use `# frozen_string_literal: true`. Be careful with string mutations:

```ruby
# Good - create mutable string
out = +""
out << data

# Bad - may cause frozen string errors  
out = ""
out << data
```

### Error Handling Patterns

```ruby
# InSpec-specific exceptions
begin
  # operation
rescue Inspec::ProfileSignatureRequired
  $stderr.puts exception.message
  Inspec::UI.new.exit(:signature_required)
rescue Inspec::Error
  $stderr.puts exception.message
  exit(1)
end
```

## Testing Patterns

InSpec uses **Minitest** as its primary testing framework with some **RSpec** integration for specific components.

### Unit Tests
Located in `test/unit/` using **Minitest framework with describe/it syntax**:

```ruby
require "helper"

describe "Backend" do
  let(:backend) { Inspec::Backend.create(Inspec::Config.mock) }

  describe "create" do
    it "accepts an Inspec::Config" do
      _(backend.is_a?(Inspec::Backend)).must_equal true
    end

    it "raises an error if no transport backend can be found" do
      err = _ { backend }.must_raise RuntimeError
      _(err.message).must_equal "Can't find transport backend 'mock'."
    end
  end
end
```

**Key Unit Test Patterns:**
- Use `require "helper"` to load test setup and utilities
- Use `describe` blocks for organizing test groups
- Use `it` blocks for individual test cases
- Use `must_equal`, `must_raise`, etc. for assertions (Minitest expectations)
- Use `let()` for setting up test data
- Use `MockLoader.new.load_resource()` for testing InSpec resources

### Functional Tests
Located in `test/functional/` for testing CLI commands and end-to-end scenarios:

```ruby
require "functional/helper"

describe "inspec exec" do
  parallelize_me!
  include FunctionalHelper

  def inspec(commandline, prefix = nil)
    @stdout = @stderr = nil
    self.out = super
  end

  it "runs a profile successfully" do
    out = inspec("exec #{profile_path}")
    _(out.exit_status).must_equal 0
  end
end
```

### Integration Tests  
Located in `test/integration/` for testing complex integration scenarios with external systems.

### Test Helpers and Utilities

**Main Test Helper (`test/helper.rb`)**:
- Sets up Minitest and RSpec coexistence
- Configures test environment and mocking
- Provides utilities like `MockLoader` for resource testing
- Handles test coverage setup with SimpleCov

**Common Testing Utilities**:
- `MockLoader.new.load_resource(resource_name, *args)` - Load resources for testing
- `FunctionalHelper` - Helper methods for CLI testing  
- Mock backends and connections for testing without real systems
- Test fixtures in `test/fixtures/` for sample profiles and data

## Remote Connection Development

### WinRM Connection Testing
```bash
# Basic WinRM test
bundle exec inspec shell -t winrm://user@host --password 'pass' --winrm-transport plaintext

# Kerberos authentication  
bundle exec inspec shell -t winrm://user@host \
  --winrm-transport kerberos \
  --kerberos-service host \
  --kerberos-realm DOMAIN.COM

# With SOCKS proxy
bundle exec inspec shell -t winrm://user@host --socks-proxy proxy:1080
```

### Train Integration
When adding new transport options:

1. Add CLI options in `base_cli.rb`
2. Ensure options flow through `Inspec::Config`
3. Update relevant train plugin (train-winrm, etc.)
4. Add integration tests

## Packaging and Distribution

### Habitat Packaging
`habitat/plan.sh` defines Habitat package build:

```bash
pkg_name=inspec
pkg_origin=chef
pkg_version=$(cat "$PLAN_CONTEXT/../VERSION")
pkg_deps=(core/ruby3_1 core/git core/bash)

do_build() {
  gem build inspec.gemspec
  gem build inspec-core.gemspec
}
```

### Expeditor Automation
`.expeditor/config.yml` manages:
- Automated version bumping
- Multi-channel releases (unstable → current → stable)  
- RubyGems publication
- Habitat package promotion
- Docker image building

## Dependencies and Bundler

### GitHub API Authentication
Required to avoid rate limiting:
```bash
bundle config --global github.com username:token
export GITHUB_TOKEN=ghp_your-token
```

### Local Development Dependencies
```ruby
# In Gemfile for local train-winrm development
gem "train-winrm", path: "/path/to/local/train-winrm"
```

## Documentation Structure and Guidelines

InSpec maintains documentation across multiple locations, each serving different purposes and audiences.

### docs.chef.io Documentation (`docs-chef-io/` folder)

All user-facing documentation visible on [docs.chef.io](https://docs.chef.io/inspec/) is maintained in the `docs-chef-io/` folder:

```
docs-chef-io/
├── content/inspec/           # Main InSpec documentation
│   ├── _index.md            # Overview page
│   ├── cli.md               # CLI reference
│   ├── resources/           # Resource documentation
│   ├── reporters.md         # Reporters documentation
│   ├── habitat.md           # Habitat integration
│   └── ...                  # Other user guides
├── layouts/                 # Hugo layout templates
├── static/                  # Static assets (images, CSS)
└── config.toml             # Hugo configuration
```

**Example Documentation File:**
```markdown
+++
title = "Resource Name"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Resource Name"
    identifier = "inspec/resources/resource_name"
    parent = "inspec/resources"
    weight = 10
+++

# Resource Description

Brief description of what the resource does...

## Syntax

Basic syntax example...

## Examples

Practical usage examples...
```

**Important Notes:**
- Confirm the different sections that needs to be included in the documentation before making any changes.

### GitHub Wiki (Release Notes)

**Location**: https://github.com/inspec/inspec/wiki/Pending-Release-Notes

**CRITICAL FOR RELEASE NOTES TASKS:**
- **ONLY provide content formatted for manual wiki update**
- **DO NOT create any files in the repository**
- **DO NOT update any existing documentation files**
- **DO NOT update habitat.md, shell.md, _index.md, or create new .md files**
- **ONLY output the structured content that can be copy-pasted to GitHub Wiki**
- **NOT controlled by code repository** - Wiki is separate from main codebase
- **Manually updated** by accessing the GitHub wiki interface directly
- Follow the content structure below for arranging the content of release notes
- Provide with the content that could be used to update manually but do not make any changes to the repository itself
- Use md format for this documentation and linked description of change with a PR. Follow this format "DESCRIPTION. ([#PR NUMBER](https://github.com/inspec/inspec/pull/#PR_NUMBER))"
- **NEVER create fictional content** - Only document real changes based on actual PRs
- **NEVER make up performance numbers** - Do not invent "40% faster" or similar claims
- **NEVER create fictional bug fixes** - Do not mention non-existent memory leaks or made-up issues
- **ALWAYS ask for actual PR list** before creating content if PRs are not provided
- **NEVER duplicate the same change across sections** - Each change belongs in only ONE section
- **ONLY document factual information** from real development work

**Prompt**: Ask for the PRs to mention in release notes content before finalizing

**For Release Notes Tasks - ONLY provide content in this structure:**

```markdown
## InSpec X.Y.Z Release Notes

### New Features
- Feature 1 description
- Feature 2 description

### Improvements
- Improvement 1 description
- Improvement 2 description

### Bug Fixes
- Bug fix 1 description
- Bug fix 2 description

### CVEs
- CVE fix 1 description (if any)

### Dependency Updates
- Dependency update 1
- Dependency update 2
```

**Content Structure Guidelines:**
- **New Features**: Major functionality additions, new resources, new CLI commands, or significant new capabilities
- **Improvements**: Performance enhancements, usability improvements, code optimizations, or enhanced existing features
- **Bug Fixes**: Important bug resolutions, critical fixes, or corrections to existing functionality
- **CVEs**: Any security vulnerabilities addressed, security patches, or security-related fixes
- **Dependency Updates**: Updates to key dependencies, Ruby version changes, or major library upgrades

**Section Assignment Rules:**
- **Ruby version upgrades** → ONLY in "Dependency Updates" section
- **New CLI commands** → ONLY in "New Features" section
- **Performance improvements** → ONLY in "Improvements" section
- **Security fixes** → ONLY in "CVEs" section
- **Bug resolutions** → ONLY in "Bug Fixes" section
- Each change should appear in EXACTLY ONE section, never multiple sections

**Process:**
1. Release notes are drafted in the "Pending Release Notes" wiki page
2. During release process, content is moved to version-specific pages
3. Updates require direct wiki access, not pull requests
4. Content is used by automated release scripts

**Prompt**:
- Ask for the PRs to mention in release notes content before finalizing

### README Files - Avoid Updates

**Policy**: README files are **rarely updated** and should **not** be modified unless absolutely necessary. So ask to confirm if any changes are needed.

### CHANGELOG.md - Auto-Generated

**Important**: `CHANGELOG.md` is **automatically generated** and should **never be manually edited**.

**Process:**
- Expeditor automation manages changelog entries
- Content comes from PR titles and labels
- Version bumps trigger automatic updates

### Development Documentation (`dev-docs/` folder)

Internal development documentation for contributors and maintainers:

```
dev-docs/
├── ci-cd.md                # CI/CD pipeline documentation
├── compliance.md           # Compliance and legal considerations
├── control-eval.md         # Control evaluation internals
├── deprecation.md          # Deprecation process
├── plugins.md              # Plugin development guide
└── ...                     # Other technical guides
```

#### Documentation Style Guidelines:
- **Clear headings**: Use descriptive, scannable headings
- **Active voice**: Write in active voice when possible
- **Consistent terminology**: Use InSpec-specific terms consistently
- **Code formatting**: Use proper syntax highlighting for code blocks

## Common File Locations

- **CLI definitions**: `lib/inspec/base_cli.rb`
- **Main runner**: `lib/inspec/runner.rb`  
- **Resources**: `lib/inspec/resources/`
- **Profiles**: `lib/inspec/profile.rb`
- **Configuration**: `lib/inspec/config.rb`
- **UI utilities**: `lib/inspec/ui.rb`
- **Version**: `VERSION` file in project root and `lib/inspec/version.rb`

## Security Considerations

- **Never log passwords** or sensitive data
- **Validate user inputs** especially for remote connections  
- **Use proper authentication methods** for different transports
- **Handle network timeouts** gracefully
- **Escape shell commands** properly

This project emphasizes **security**, so always consider it when contributing code.

## Task Implementation Workflow

### 1. Jira Integration with MCP Server

When a Jira ID is provided:

1. **Fetch Jira Issue Details**: Use the `atlassian-mcp-server` MCP server to fetch issue details
   ```
   Use mcp_atlassian-mcp_getJiraIssue with the provided Jira ID
   ```
2. **Read and Analyze**: Carefully read the story, acceptance criteria, and requirements
3. **Plan Implementation**: Break down the task into smaller, manageable components
4. **Proceed with Implementation**: Follow the workflow below

### 2. Complete Development Workflow

All tasks should follow this prompt-based workflow:

#### Step 1: Analysis and Planning
1. **Understand Requirements**: 
   - If Jira ID provided, fetch issue details using MCP server
   - Analyze the requirements thoroughly
   - Identify affected components and files
2. **Plan Implementation**:
   - Break down into smaller tasks
   - Identify files to be modified/created
   - Plan test strategy
3. **Provide Summary**: Summarize understanding and ask for confirmation
4. **Prompt**: **Analysis Complete**. Next step: Start implementation. Other steps remaining: Implementation → Testing → Committing the code → PR Creation. Do you want to continue with the implementation?"

#### Step 2: Implementation
1. **Code Implementation**:
   - **Read InSpec Context First**: Review relevant sections from this instructions file based on your task:
     - **Documentation work**: Follow the **Documentation Structure and Guidelines** section
     - **CLI changes**: Reference **CLI Option Management** patterns and **Base CLI Options**
     - **Resource development**: Use **Resource Development** patterns and check `lib/inspec/resources/`
     - **Transport/connection work**: Review **Transport Layer Integration** and **Remote Connection Development**
     - **Testing framework**: Follow **Testing Patterns** section (Unit Tests, Functional Tests, Integration Tests)
     - **Licensing features**: Reference **Licensing System** integration patterns
     - **Plugin development**: Check **Plugin system files** and existing plugins in `lib/plugins/`
     - **Packaging/distribution**: Review **Packaging and Distribution** section for Habitat/Omnibus changes
   - **Follow Coding Standards**:
     - Use **Code Style Guidelines** for Ruby version compatibility and string literals
     - Follow **Error Handling Patterns** for InSpec-specific exceptions
     - Check **Key Development Patterns** for architecture-specific guidance
   - **Implementation Approach**:
     - Follow existing code patterns and styles in similar files
     - Implement changes incrementally
     - Follow Ruby/InSpec best practices as documented above
     - Check **Common File Locations** to understand where different types of code should go
     - Review **Files and Areas to Avoid Modifying** before making changes
2. **Progress Updates**: After each significant change, provide summary
3. **Prompt**: **Implementation Complete**. Next step: Create unit tests. Other steps remaining: Testing → Committing the code → PR Creation. Do you want to continue with creating tests?"

#### Step 3: Testing
1. **Create Unit Tests**:
   - Write comprehensive unit tests for new functionality
   - Follow the **Testing Patterns** section above for proper structure and syntax
   - Use Minitest framework with describe/it syntax as documented
   - Follow existing test patterns in `test/unit/` and use `MockLoader` for resource testing
   - Ensure good test coverage
   - Skip the test cases if the change is a documentation change.
2. **Run Tests**: Execute tests to verify functionality if test cases were added
3. **Prompt**: **Tests Complete**. Next step: Committing the code. Other steps remaining: Committing the code → PR Creation. Do you want to continue with committing the code?"

#### Step 4: Committing the code
1. **Create Branch**: Use Jira ID as branch name (if provided)
2. **Stage Changes**: Add all modified files to git staging
3. **Commit with Signing**: Use `git commit -s` to sign commits as required by InSpec project
4. **Commit Message Format**: Use meaningful commit messages following conventional commit format
5. **Separate Commits**: Create separate commits for different types of changes (code, tests, docs)
6. **Prompt**: **Code committed Successfully**. Next step: Create PR with GitHub CLI. Other steps remaining: PR Creation. Do you want to continue with PR creation?"

#### Step 5: PR Creation
1. **Push Branch**: Push to remote repository
2. **Follow PR Creation Process**: Use the comprehensive process outlined in "GitHub CLI and PR Creation Process" section below
3. **Final Prompt**: **PR Created Successfully**. All steps completed!"

### 3. Prompt-Based Execution

- **All tasks must be prompt-based**: After each major step, provide a summary and ask for confirmation to proceed
- **Clear Communication**: Always explain what was done and what comes next
- **User Control**: Wait for user confirmation before proceeding to the next step
- **Progress Tracking**: Clearly indicate which steps are completed and which remain

### 4. GitHub CLI and PR Creation Process

Complete process for branch management and PR creation:

1. **Authentication**: Use GitHub CLI authentication (no .profile references)
   ```bash
   gh auth status
   # If not authenticated:
   gh auth login
   ```

2. **Branch Creation**: Use Jira ID as branch name
   ```bash
   git checkout -b {JIRA_ID}
   ```

3. **PR Title Selection**: Before creating PR, ask user to select change type:
   ```
   What type of change is this PR?
   1. feat: New feature or functionality
   2. fix: Bug fix
   3. docs: Documentation changes
   4. refactor: Code refactoring without functionality change
   5. test: Adding or updating tests
   6. chore: Maintenance tasks, dependency updates
   7. perf: Performance improvements
   8. style: Code style/formatting changes
   9. ci: CI/CD pipeline changes
   10. revert: Reverting previous changes
   ```

4. **PR Creation**: Use GitHub CLI with dynamic title based on user selection
   ```bash
   gh pr create --title "{CHANGE_TYPE}: {JIRA_ID} - Brief description" --body-file pr_template.md
   ```

   Examples:
   - `feat: CHEF-1234 - Add new telemetry opt-out feature`
   - `fix: CHEF-5678 - Resolve memory leak in resource loading`
   - `docs: CHEF-9999 - Update CLI documentation`

5. **PR Description Format**: **MUST** follow this exact template format:
   ```markdown
   <!--- Provide a short summary of your changes in the Title above -->

   ## Description
   <!--- Describe your changes in detail, what problems does it solve? -->

   ## Related Issue
   <!--- If you are suggesting a new feature or change, please create an issue first -->
   <!--- Please link to the issue, discourse, or stackoverflow here: -->

   ## Types of changes
   <!--- What types of changes does your code introduce? Put an `x` in all the boxes that apply: -->
   - [ ] Bug fix (non-breaking change which fixes an issue)
   - [ ] New content (non-breaking change)
   - [ ] Breaking change (a content change which would break existing functionality or processes)

   ## Checklist:
   <!--- Go over all the following points, and put an `x` in all the boxes that apply. -->
   <!--- If you're unsure about any of these, don't hesitate to ask. We're here to help! -->
   - [ ] I have read the **CONTRIBUTING** document.
   ```

6. **Execute PR Creation**:
   - Create temporary `pr_template.md` with filled template
   - Run: `gh pr create --title "{CHANGE_TYPE}: {JIRA_ID} - Brief description" --body-file pr_template.md`
   - Clean up temporary file
   - **Always use exact template format** - never modify structure

### 5. MCP Server Integration (atlassian-mcp-server)

For Jira interactions, use the following MCP server functions:

- **Get Issue**: `mcp_atlassian-mcp_getJiraIssue` - Fetch issue details
- **Search Issues**: `mcp_atlassian-mcp_searchJiraIssuesUsingJql` - Search for related issues
- **Add Comments**: `mcp_atlassian-mcp_addCommentToJiraIssue` - Add progress comments
- **Transition Issue**: `mcp_atlassian-mcp_transitionJiraIssue` - Move issue status

### 6. Files and Areas to Avoid Modifying

**Prohibited Files/Areas**:
- `VERSION` file (managed by release process)
- `.expeditor/` configuration (CI/CD automation)
- `habitat/` packaging files (unless specifically required)
- `omnibus/` packaging (unless specifically required)
- `Gemfile.lock` (generated file)
- Any files marked as auto-generated
