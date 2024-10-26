# ccminer for Android

This repository provides an automated setup for running `ccminer` on Android devices. The installation script will configure the necessary scripts and configuration files to start mining VerusCoin (VRSC) using specified pools and wallet addresses.

## Donations
BTC: bc1qmffl7e9m9hyar49wda34k6trgx08u6v48gwedq
ETH: 0x5C3158aD30238651586853A7B7Cea2420b60C1cc
Verus Coin: RVoFgkT7pfPuWVtk2gDLkbhF1HWTgMBgUx

## Features

- Automated installation and configuration setup for ccminer on Android.
- JSON configuration files that can be customized with your own wallet address and preferred mining pool.
- Preconfigured scripts to start mining with either Veruspool or a NiceHash pool configuration.

---

## Installation Instructions

To install and set up ccminer on your Android device, follow these steps:

1. **Download and Run the Installation Script**

   Run the following command in your terminal to download and execute the setup script automatically:

   ```bash
   curl -o- -k https://raw.githubusercontent.com/tanishdt/ccminer_android/main/install.sh | bash
   ```

   This command will:
   - Download and execute the `install.sh` script from this repository.
   - Set up the required `ccminer` environment on your device.
   - Create two mining scripts (`mine_verus.sh` and `mine_verus_nh.sh`) to start mining with different configurations.
   - Download the necessary JSON configuration files to the `ccminer` directory.

---

## Usage

After installation, you’ll find the following scripts available:

1. **Starting Mining with Veruspool Configuration**

   To mine using the Veruspool configuration, run:

   ```bash
   ./mine_verus.sh
   ```

   This script will use the `config_veruspool.json` file for configuration.

2. **Starting Mining with NiceHash Configuration**

   To mine using the NiceHash configuration, run:

   ```bash
   ./mine_verus_nh.sh
   ```

   This script will use the `config.json` file for configuration.

---

## Customization

The JSON configuration files `config.json` and `config_veruspool.json` are located in the `ccminer` directory. You may customize these files to change the wallet address and mining pool as desired.

### Updating Wallet Address and Mining Pool

1. **Locate the Configuration Files**

   Open either `config.json` or `config_veruspool.json` in a text editor. These files are located in the `~/ccminer` directory.

2. **Edit the Wallet Address**

   Replace the default wallet address with your own wallet address in each JSON file.

3. **Edit the Pool Information**

   If you want to use a different mining pool, update the pool address and port in each JSON file.

4. **Save Your Changes**

   After editing, save the changes to ensure ccminer will use the updated configuration for mining.

---

## Script Overview

### `start.sh`

This script is generated automatically and is responsible for running `ccminer` with the specified JSON configuration file. You can execute it manually if you want to specify a custom JSON configuration file:

```bash
./start.sh <custom_config.json>
```

### `mine_verus.sh`

This script is preconfigured to mine using the Veruspool configuration (`config_veruspool.json`).

### `mine_verus_nh.sh`

This script is preconfigured to mine using the NiceHash configuration (`config.json`).

---

## Notes

- **Permissions**: Make sure that all scripts are executable. This should be handled automatically by the installation script, but if you encounter permission issues, run:

  ```bash
  chmod +x ~/ccminer/start.sh ~/mine_verus.sh ~/mine_verus_nh.sh
  ```

- **Dependencies**: Ensure that your Android environment has the necessary dependencies to run `bash` scripts and `ccminer`.

---
Enjoy mining with `ccminer` on Android!
---
