# Dummy host

This Rails app exists to boot `recording_studio_affiliates`. It is not the product.

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Open `http://localhost:3000/up` to confirm the process is up. The engine is mounted at `/recording_studio_affiliates` and has no screens in version 0.1.0.
