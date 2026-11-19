# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-11-19

### Added
- Mountable Rails engine for affiliate commissions paid via Stripe Connect.
- Install generator, migrations generator, configuration, and service hooks.
- Dummy host app used to boot the engine. Its `flat_pack` dependency is pinned to upstream `v0.1.33`.

### Removed
- The private `flatpack-checker` gem and its GitHub Actions workflow. The dummy app still uses the public `flat_pack` UI library.

This release does not record commissions or pay them through Stripe.

[0.1.0]: https://github.com/bowerbird-app/RecordingStudio_affiliates/releases/tag/v0.1.0
