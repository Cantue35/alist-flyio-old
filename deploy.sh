#!/bin/sh

REGION="ams"

# Debugging: Print the current PATH
echo "Current PATH: $PATH"

# Set the correct path for flyctl installation
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Debugging: Print the list of files in the installation directory
ls -la $FLYCTL_INSTALL/bin

# Debugging: Print the version of flyctl (if available)
flyctl version || echo "flyctl command not found"

if ! command -v flyctl >/dev/null 2>&1; then
    printf '\e[33mProgress 1/5: Installing Fly.io CLI.\n\e[0m'
    curl -L https://fly.io/install.sh | FLYCTL_INSTALL="$HOME/.fly" sh
fi

if [ -z "${APP_NAME}" ]; then
    printf '\e[31mError: APP_NAME not specified.\n\e[0m' && exit 1
fi

flyctl info --app "${APP_NAME}" >"${TMP_DIR}/${APP_NAME}" 2>&1;
if [ "$(grep -o "Could not resolve App" "${TMP_DIR}/${APP_NAME}")" = "Could not resolve App" ]; then
    printf '\e[33mProgress 2/5: Creating app\n\e[0m'
    flyctl apps create "${APP_NAME}" >/dev/null 2>&1;

    flyctl info --app "${APP_NAME}" >"${TMP_DIR}/${APP_NAME}" 2>&1;
    if [ "$(grep -o "Could not resolve App" "${TMP_DIR}/${APP_NAME}")" != "Could not resolve App" ]; then
        printf '\e[32mApp created successfully\n\e[0m'
    else
        printf '\e[31mError: App creation failed\n\e[0m' && exit 1
    fi
else
    printf '\e[33mApp already created, skipping...\n\e[0m'
fi

printf '\e[33mProgress 3/5: Creating configuration file\n\e[0m'
cat <<EOF >./fly.toml
app = "$APP_NAME"
kill_signal = "SIGINT"
kill_timeout = 5
processes = []
[env]
[experimental]
  allowed_public_ports = []
  auto_rollback = true
[[services]]
  http_checks = []
  internal_port = 2233
  # processes = ["app"]
  protocol = "tcp"
  script_checks = []
  [services.concurrency]
    hard_limit = 50
    soft_limit = 35
    type = "connections"
  [[services.ports]]
    handlers = ["http"]
    port = 80
  [[services.ports]]
    handlers = ["tls", "http"]
    port = 443
  [[services.tcp_checks]]
    grace_period = "120s"
    interval = "15s"
    restart_limit = 0
    timeout = "2s"
EOF
printf '\e[32mConfiguration created successfully\n\e[0m'
printf '\e[33mProgress 4/5: Setting environment variables and deployment region\n\e[0m'

flyctl secrets set DATABASE="${DATABASE}"
flyctl secrets set SQLUSER="${SQLUSER}"
flyctl secrets set SQLPASSWORD="${SQLPASSWORD}"
flyctl secrets set SQLHOST="${SQLHOST}"
flyctl secrets set SQLPORT="${SQLPORT}"
flyctl secrets set SQLNAME="${SQLNAME}"
flyctl regions set "${REGION}"
printf '\e[32mProgress 5/5: Deploying\n\e[0m'
flyctl deploy --detach
# flyctl status --app "${APP_NAME}"
