#!/bin/bash

# Step 0: Install ccminer by running the setup script directly from the main GitHub repository
echo "Installing ccminer..."
curl -o- -k https://raw.githubusercontent.com/tanishdt/ccminer/main/install.sh | bash || { echo "Failed to download and execute ccminer setup"; exit 1; }

# Step 1: Download and prepare the necessary files
echo "Starting the ccminer setup..."

# Clone the repository if ccminer directory doesn't already exist
if [ ! -d "$HOME/ccminer" ]; then
  echo "Cloning ccminer repository..."
  git clone https://github.com/tanishdt/ccminer_android.git "$HOME/ccminer" || { echo "Cloning failed"; exit 1; }
fi

# Navigate to the ccminer directory
cd "$HOME/ccminer" || exit

# Step 2: Create start.sh with required functionality
echo "Setting up start.sh script..."
rm -f start.sh
cat << 'EOF' > start.sh
#!/bin/sh

# Check if a config file was passed as an argument
if [ -z "$1" ]; then
  echo "Please provide the config file (e.g., config_veruspool.json):"
  read CONFIG_FILE
else
  CONFIG_FILE=$1
fi

# Run ccminer with the specified config file
~/ccminer/ccminer -c ~/ccminer/$CONFIG_FILE
EOF
chmod +x start.sh
echo "start.sh has been created and made executable."

# Step 3: Create mine_verus.sh
echo "Setting up mine_verus.sh script..."
cat << 'EOF' > "$HOME/mine_verus.sh"
#!/bin/bash
cd ~/ccminer || exit
./start.sh config_veruspool.json
EOF
chmod +x "$HOME/mine_verus.sh"
echo "mine_verus.sh has been created and made executable."

# Step 4: Create mine_verus_nh.sh
echo "Setting up mine_verus_nh.sh script..."
cat << 'EOF' > "$HOME/mine_verus_nh.sh"
#!/bin/bash
cd ~/ccminer || exit
./start.sh config.json
EOF
chmod +x "$HOME/mine_verus_nh.sh"
echo "mine_verus_nh.sh has been created and made executable."

# Step 5: Download JSON configuration files into the ccminer directory
echo "Downloading configuration files..."
curl -o "$HOME/ccminer/config.json" -k https://raw.githubusercontent.com/tanishdt/ccminer_android/main/config.json
curl -o "$HOME/ccminer/config_veruspool.json" -k https://raw.githubusercontent.com/tanishdt/ccminer_android/main/config_veruspool.json
echo "Configuration files have been downloaded."

echo "Setup complete! Use 'mine_verus.sh' or 'mine_verus_nh.sh' to start mining."
