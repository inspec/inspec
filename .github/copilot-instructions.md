# InSpec

InSpec is an open-source testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements.

## Tech Stack

- **Language:** Ruby
- **Testing Frameworks:** RSpec, Minitest
- **Core Dependencies:**
  - `train`: A transport interface for communicating with remote systems.
  - `chef-licensing`: For handling Chef licenses.
  - `cookstyle`: For linting Chef Infra cookbooks.
- **Build & Packaging:** Bundler, Rake, Habitat

## Coding Guidelines and Conventions

- Follow the rules defined in our `.rubocop.yml` file.
- **Argument Alignment:** Use the `with_first_argument` style for argument alignment.
- **Testing:**
  - Unit tests are written with Minitest and RSpec.
  - Integration tests use Test Kitchen with the `kitchen-dokken` driver.

## Project Structure

- `lib/`: The main source code for the InSpec gem.
  - `lib/inspec/`: Core InSpec functionality.
  - `lib/plugins/`: InSpec plugins.
  - `lib/resources/`: InSpec resources.
- `test/`: Unit and integration tests.
  - `test/unit/`: Unit tests.
  - `test/integration/`: Integration tests.
- `examples/`: Example InSpec profiles and usage.
- `inspec-bin/`: The `inspec` executable.
- `habitat/`: Habitat packaging scripts.
- `omnibus/`: Omnibus packaging scripts.
