> **Architecture Documentation**
> *   **Canonical Source:** [bowerbird-app/gem_template](https://github.com/bowerbird-app/gem_template/tree/main/docs/gem_template)
> *   **Last Updated:** April 30, 2026
>
> *Maintainers: Please update the date above when modifying this file.*

---

# Local Development Setup

This guide covers setting up the gem for local development outside of GitHub Codespaces.

---

## Prerequisites

| Dependency | Version | Notes |
|------------|---------|-------|
| Ruby | 3.3+ | Check with `ruby -v` |
| PostgreSQL | 16+ | UUID support required |
| Redis | 7+ | For Action Cable / caching |
| Node.js | 18+ | For TailwindCSS CLI (optional if using standalone) |
| FlatPack (dummy app) | 0.1.33 | Pinned to the upstream `v0.1.33` Git tag in `test/dummy/Gemfile` |

---

## Setup Steps

### 1. Clone the Repository

```bash
git clone https://github.com/bowerbird-app/gem_template.git
cd gem_template
```

### 2. Configure GitHub Access

The root `Gemfile` installs `flatpack-checker` from the private repository `bowerbird-app/flatpack-checker`.

Export an org token with read access before running Bundler:

```bash
export BOWERBIRD_ORG_CI_TOKEN=your_token_here
export BUNDLE_GITHUB__COM="x-access-token:${BOWERBIRD_ORG_CI_TOKEN}"
```

You can also persist it in Bundler's local config:

```bash
bundle config set --local github.com "x-access-token:${BOWERBIRD_ORG_CI_TOKEN}"
```

### 3. Install Gem Dependencies

```bash
bundle install
```

### 4. Setup the Dummy App

```bash
cd test/dummy
bundle install
```

The dummy app tracks FlatPack `0.1.33` and loads the local `gem_template` path dependency, so rerun `bundle install` here after changing either dependency.

### 5. Configure Database

Edit `test/dummy/config/database.yml` if your PostgreSQL setup differs from defaults:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  host: <%= ENV.fetch("DB_HOST", "localhost") %>
  port: <%= ENV.fetch("DB_PORT", 5432) %>
```

### 5. Run Tests

```bash
bundle exec rake test
```

---

## Troubleshooting
  username: <%= ENV.fetch("DB_USER", "postgres") %>
  password: <%= ENV.fetch("DB_PASSWORD", "postgres") %>
```

Or export environment variables:

```bash
export DB_HOST=localhost
export DB_USER=your_user
export DB_PASSWORD=your_password
```

### 6. Prepare the Database

```bash
cd test/dummy
bin/rails db:prepare
```

This creates the database, runs migrations (including enabling `pgcrypto` for UUIDs), and seeds data.

### 7. Build TailwindCSS

```bash
bin/rails tailwindcss:build
```

If you update the FlatPack dependency again, rebuild Tailwind so the generated CSS rescans the installed FlatPack component classes.

### 8. Start the Development Server

```bash
bin/dev
```

This runs both the Rails server and Tailwind watcher via Foreman.

Alternatively, run just the Rails server:

```bash
bin/rails server
```

### 9. Visit the App

Open http://localhost:3000/gem_template

---

## Common Tasks

### Run Tests

```bash
# From the gem root
bundle exec rake test
```

### Run RuboCop

```bash
bundle exec rubocop
```

### Rebuild Tailwind

```bash
cd test/dummy
bin/rails tailwindcss:build
```

### Reset Database

```bash
cd test/dummy
bin/rails db:reset
```

### Add a Migration

```bash
cd test/dummy
bin/rails generate migration AddFieldToModel field:type
bin/rails db:migrate
```

---

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DB_HOST` | `localhost` | PostgreSQL host |
| `DB_PORT` | `5432` | PostgreSQL port |
| `DB_USER` | `postgres` | PostgreSQL username |
| `DB_PASSWORD` | `postgres` | PostgreSQL password |
| `DB_NAME` | `app_development` | Database name |
| `REDIS_URL` | `redis://localhost:6379/0` | Redis connection URL |
| `PORT` | `3000` | Rails server port |
| `BOWERBIRD_ORG_CI_TOKEN` | none | GitHub token with read access to `bowerbird-app/flatpack-checker` |
| `BUNDLE_GITHUB__COM` | none | Bundler GitHub credential, usually `x-access-token:${BOWERBIRD_ORG_CI_TOKEN}` |

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `PG::ConnectionBad` | Ensure PostgreSQL is running and credentials are correct. |
| `relation does not exist` | Run `bin/rails db:prepare` to create tables. |
| Tailwind styles missing | Run `bin/rails tailwindcss:build`. |
| Port 3000 in use | Use `PORT=3001 bin/dev`. |
| Redis connection refused | Start Redis: `redis-server` or `brew services start redis`. |
| Bundle install fails with `403` for `flatpack-checker` | Export `BOWERBIRD_ORG_CI_TOKEN` and set `BUNDLE_GITHUB__COM` before running Bundler. |
| Bundle install fails | Check Ruby version matches `.ruby-version` (3.3.0). |

---

## Project Structure

```
gem_template/
├── app/                      # Engine application code
│   ├── controllers/gem_template/
│   └── views/gem_template/
├── config/
│   └── routes.rb             # Engine routes
├── lib/
│   ├── gem_template.rb       # Main entry point
│   ├── gem_template/
│   │   ├── configuration.rb  # Configuration API
│   │   ├── engine.rb         # Engine definition
│   │   └── version.rb
│   └── generators/           # Install generator
├── test/
│   ├── dummy/                # Test Rails application
│   └── *_test.rb             # Unit tests
├── docs/                     # Documentation
├── Gemfile
├── Rakefile
└── gem_template.gemspec
```

---

## Next Steps

- [Rename the gem](RENAMING.md) to your own name
- [Configure the gem](CONFIGURATION.md) with your settings
- [Understand Tailwind setup](TAILWIND.md)
- [Install in a host app](INSTALLING.md)

---

Happy hacking! 💻
