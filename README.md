# recording_studio_affiliates

Recording Studio gem for affiliate commissions paid via Stripe Connect.

Version 0.1.0 is an early engine shell. It does not record commissions, and it does not pay them through Stripe.

## What you can do

Mount the engine in a host Rails app. The install generator adds the mount and a configuration initializer. The dummy app in `test/dummy` is a host used to boot the engine.

## Development

Install dependencies and run the gem tests from the repository root.

```bash
bundle install
bundle exec rake test
bundle exec rake test:rename_verification
```

Boot the dummy app from `test/dummy`.

```bash
bundle install
bin/rails db:prepare
bin/dev
```

The dummy app listens on port 3000. `GET /up` is the health check.

## License

MIT. See [MIT-LICENSE](MIT-LICENSE).
