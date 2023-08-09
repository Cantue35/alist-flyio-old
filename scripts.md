### The GitHub Actions workflow does the following steps:
1. Defines the name of the workflow as "Fly Deploy cd."

2. Specifies the events that triggers the workflow: `push` events and a scheduled event every month on the 3rd day at 8 AM (UTC).

3. Sets environment variables using GitHub secrets for various configuration values.

4. Defines a job named "deploy" that runs on an `ubuntu-latest` runner.

5. The steps in the job include:
<br> Checking out the repository using the `actions/checkout` action.
<br> Running the `deploy.sh` script using the `sh` command.



#
#
### alist.sh script performs the following actions:

1. Creates a directory named `/opt/alist/data/` to store configuration files.

2. Generates a configuration file named `config.json` in the `/opt/alist/data/` directory with the provided configuration settings.

3. Changes the working directory to `/opt/alist`

4. Executes the `alist` application using the generated `config.json` file.

* Before running this script, make sure you have the necessary values (`$DATABASE`, `$SQLUSER`, `$SQLPASSWORD`, `$SQLHOST`, `$SQLPORT`, `$SQLNAME`) defined in your environment variables.




#
#
### deploy.sh script performs the following actions:

1. Checks if the Fly CLI is installed and installs it if not.

2. Checks if `APP_NAME` is specified as a secret in the GitHub repository.

3. Checks if the Fly.io app exists, and if not, creates it using the specified `APP_NAME`

4. Creates a `fly.toml` configuration file for Fly.io

5. Sets secrets and regions for the app using Fly CLI.

6. Deploys the app using the Fly CLI with the `--detach` flag to run the deployment in the background.

* This script is designed to automate the deployment process, ensuring that your AList application is deployed to Fly.io using the provided configuration and secrets.



#
#
#### If you have any questions or need further assistance, feel free to ask!