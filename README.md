# AList on Fly.io
## Status
[![Fly Deploy cd](https://github.com/Cantue35/alist-flyio/actions/workflows/main.yml/badge.svg)](https://github.com/Cantue35/alist-flyio/actions/workflows/main.yml)
## Overview
Deploy [AList](https://github.com/alist-org/alist) on [Fly.io](https://fly.io) platform.

Features: Completely avoid ban permissions (Netherlands 🇳🇱, Amsterdam), comes with CDN.

## How to Deploy
1. First, register an account on [Fly.io](https://fly.io/), ***note: remember to link a credit card, UnionPay works.***

   
2. Add the following secure fields (Secrets) in GitHub Actions: `FLY_API_TOKEN`、`APP_NAME`、`DATABASE`、`SQLUSER`、`SQLPASSWORD`、`SQLHOST`、`SQLPORT` and `SQLNAME`
* FLY_API_TOKEN - Fly API Interface Token value, obtainable from <https://web.fly.io/user/personal_access_tokens> or execute `flyctl auth token` locally.
* APP_NAME - Application name, note that this name must be globally unique.
* DATABASE - Database type (sqlite3 / mysql).
* SQLUSER - MySQL username (required when using remote MySQL).
* SQLPASSWORD - MySQL password (required when using remote MySQL).
* SQLHOST - MySQL host address (required when using remote MySQL).
* SQLPORT - MySQL port (required when using remote MySQL).
* SQLNAME - MySQL database name (required when using remote MySQL).
3. Push the code to trigger deployment. Additionally, automatic deployment is set for the 3rd day of each month at 8 AM (UTC).

   
## FAQ
What is will be the username and password?
Its mentioned in the [AList Docs](https://alist.nn.ci/guide/install).

If you have any questions or need assistance with specific parts of the deployment process, feel free to ask!
