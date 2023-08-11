# GitHub Actions Workflow and Deployment Scripts

## GitHub Actions Workflow (`main.yml`):

The GitHub Actions workflow leads the deployment process with the following key steps:

1. Workflow Identification:
   - Defines the workflow's name as "flyctl deploy".

2. Trigger Specification:
   - Triggers the workflow on `push` events and schedules a monthly event on the 4th day at 8 AM (UTC).

3. Secret-based Environment Setup:
   - Sets crucial configuration values as environment variables using GitHub secrets.

4. Deployment Job Definition:
   - Configures a job named "deploy" running on an `ubuntu-latest` runner.

5. Job Execution Steps:
   - Utilizes the `actions/checkout` action to retrieve the repository.
   - Executes the `deploy.sh` script using the `sh` command.

## alist.sh Script:

The `alist.sh` script leads the setup and execution of your AList application:

1. Configuration Directory Creation:
   - Creates a directory `/opt/alist/data/` for storing configuration files.

2. Configuration File Generation:
   - Generates a `config.json` file with provided configuration settings in the `/opt/alist/data/` directory.

3. Working Directory Change:
   - Shifts the current working directory to `/opt/alist`.

4. Application Execution:
   - Launches the `alist` application using the generated `config.json` file.

* Precaution: Before running the script, ensure that environment variables (`$DATABASE`, `$SQLUSER`, `$SQLPASSWORD`, `$SQLHOST`, `$SQLPORT`, `$SQLNAME`) are defined with appropriate values.

## deploy.sh Script:

The `deploy.sh` script leads the Fly.io deployment process:

1. Fly CLI Check and Installation:
   - Checks for Fly CLI presence and installs it if not found.

2. App Existence Check and Creation:
   - Checks for `APP_NAME` secret and app existence, creating the app if not present.

3. Configuration File Creation:
   - Creates a `fly.toml` configuration file for Fly.io.

4. Secret and Region Setup:
   - Sets secrets and regional preferences for the app using Fly CLI.

5. Background Deployment:
   - Executes the app deployment using the Fly CLI with the `--detach` flag, allowing deployment in the background.

* Automation Goal: This script streamlines the deployment process, ensuring that your AList app is efficiently deployed on Fly.io using provided configurations and secrets.

## Feel Free to Reach Out:

If you have any inquiries or require additional assistance, don't hesitate to ask.
