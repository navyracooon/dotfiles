#!/bin/sh

CONFIG_PATH="$HOME/.config/chezmoi/chezmoi.toml"

if [ -f "$CONFIG_PATH" ]; then
  echo "Error: $CONFIG_PATH already exists. Aborting."
  exit 1
fi

printf "Enter your Git name: "
read git_name

printf "Enter your Git email: "
read git_email

mkdir -p "$(dirname "$CONFIG_PATH")"

cat > "$CONFIG_PATH" <<EOF
[data]
    git_name = "$git_name"
    git_email = "$git_email"
EOF

echo "chezmoi.toml has been created at $CONFIG_PATH"
