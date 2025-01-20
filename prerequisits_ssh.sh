#!/bin/bash

#permission
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
#ownership
sudo chown vagrant:vagrant ~/.ssh
sudo chown vagrant:vagrant ~/.ssh/id_rsa


# Define the configuration file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Function to update or add configuration settings
update_sshd_config() {
    local setting="$1"
    local value="$2"

    # Check if the setting exists and update it, otherwise add it
    if grep -q "^${setting}" "$SSHD_CONFIG"; then
        sudo sed -i "s|^${setting}.*|${setting} ${value}|" "$SSHD_CONFIG"
    else
        echo "${setting} ${value}" | sudo tee -a "$SSHD_CONFIG" > /dev/null
    fi
}

# Update sshd_config with required settings
echo "Updating $SSHD_CONFIG..."
update_sshd_config "PubkeyAuthentication" "yes"
update_sshd_config "AuthorizedKeysFile" ".ssh/authorized_keys"
update_sshd_config "PasswordAuthentication" "no"

# Restart the SSH service to apply changes
echo "Restarting SSH service..."
sudo systemctl restart sshd

# Confirm the service status
echo "SSH service status:"
sudo systemctl status sshd --no-pager


