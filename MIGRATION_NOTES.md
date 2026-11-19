# Migration notes

## 0.1.0

This is the first release of `recording_studio_affiliates`. There is no earlier version of this gem to upgrade.

Do not mount it in a host that needs commission records or Stripe payouts. Those are not in 0.1.0.

When a later version adds tables, copy them into the host with:

```bash
bin/rails generate recording_studio_affiliates:migrations
bin/rails db:migrate
```
