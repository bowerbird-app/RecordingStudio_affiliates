# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.1] - 2026-04-30

### Changed
- Pinned the dummy app's `flat_pack` dependency to the upstream `v0.1.33` Git tag instead of a moving GitHub revision.
- Refreshed the dummy app bundle to track `flat_pack` `0.1.33` and the local `gem_template` `0.1.1` path dependency.

### Docs
- Updated setup and migration documentation to reflect the FlatPack `0.1.33` target for local development.

## [0.1.0] - 2025-12-04

### Added
- Initial release
- Rails mountable engine structure
- PostgreSQL with UUID primary keys support
- TailwindCSS v4 integration
- GitHub Codespaces devcontainer configuration
- Docker Compose setup with PostgreSQL and Redis
- Install generator for host applications
- Comprehensive README and documentation
- Basic test suite with Minitest

[Unreleased]: https://github.com/bowerbird-app/gem_template/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/bowerbird-app/gem_template/releases/tag/v0.1.1
[0.1.0]: https://github.com/bowerbird-app/gem_template/releases/tag/v0.1.0
