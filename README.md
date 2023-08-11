# AList on Fly.io

## Status
[![flyctl deploy](https://github.com/Cantue35/alist-flyio/actions/workflows/main.yml/badge.svg)](https://github.com/Cantue35/alist-flyio/actions/workflows/main.yml)

## Overview
Deploy [AList](https://github.com/alist-org/alist) on the [Fly.io](https://fly.io) platform with ease.

**Features:**
- Seamlessly bypass ban permissions (Amsterdam, Netherlands 🇳🇱).
- Integrated CDN for enhanced performance.

## How to Deploy
1. **Account Setup:**
   - Begin by registering an account on [Fly.io](https://fly.io/). *Important:* Remember to link a credit card during registration. UnionPay is an acceptable option.

2. **Configuration Secrets:**
   - Integrate the following secure fields (Secrets) in GitHub Actions:
      - `FLY_API_TOKEN` – Obtain the Fly API Interface Token from [here](https://web.fly.io/user/personal_access_tokens) or through `flyctl auth token` on your local machine.
      - `APP_NAME` – Name your application uniquely.
      - `DATABASE` – Define the database type (sqlite3 / mysql).
      - `SQLUSER` – Specify the MySQL username (mandatory for remote MySQL usage).
      - `SQLPASSWORD` – Enter the MySQL password (mandatory for remote MySQL usage).
      - `SQLHOST` – Set the MySQL host address (mandatory for remote MySQL usage).
      - `SQLPORT` – Define the MySQL port (mandatory for remote MySQL usage).
      - `SQLNAME` – Name the MySQL database (mandatory for remote MySQL usage).

3. **Trigger Deployment:**
   - Push your code to initiate the deployment process. Additionally, automated deployment is configured for the 4th day of each month at 8 AM (UTC).

## FAQ & Links
- **Username and Password:**
   - The username and password details are outlined in the [AList Documentation](https://alist.nn.ci/guide/install).

- **Helpful Resources:**
   - [Docker Configuration Details](https://github.com/Cantue35/alist-flyio/blob/main/docker.md)
   - [In-depth Explanation of Scripts](https://github.com/Cantue35/alist-flyio/blob/main/scripts.md)

If you have any questions or require assistance at any step of the deployment process, don't hesitate to reach out. For quick answers to common queries, be sure to check the [AList FAQ](https://alist.nn.ci/faq/) section.

## Found this Repository Useful?

If you found this repository helpful, please consider giving it a star! ⭐ Your support is greatly appreciated and encourages me to continue improving and maintaining this project and projects like this.

[![Star this repository](https://img.shields.io/github/stars/Cantue35/alist-flyio.svg?style=social)](https://github.com/Cantue35/alist-flyio/stargazers)