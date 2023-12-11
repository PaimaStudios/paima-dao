# Paima DAO

This is a Paima DAO smart contract, to be deployed on Astar Network.  
Shibuya is used as a testnet. Get test tokens [here](https://docs.astar.network/docs/build/environment/faucet/)

Deployed on Shibuya: [0xe67Bd26330263b9830CD4E81e3faE298E8F5e487](https://blockscout.com/shibuya/address/0xe67Bd26330263b9830CD4E81e3faE298E8F5e487)

### Preparing for usage

1. Install Foundry by following the instructions from [their repository](https://github.com/foundry-rs/foundry#installation).
2. Copy the `.env.template` file to `.env` and fill in the variables.
3. Install the dependencies by running: `yarn`

### Compiling smart contracts

```bash
yarn compile
yarn compile:sizes (to see contracts sizes)
```

### Running local chain and deploying to it

```bash
yarn anvil
yarn deploy:localhost
```

### Deploying to testnet or mainnet

Deploying will automatically verify the smart contracts on Blockscout. To disable this, remove the verifying arguments from the script.

#### WSL2

WSL2 cannot access USB devices in Windows by default, so you will need to expose your Trezor device to WSL2.

1. In WSL2, run the CURL command to install the `udev` rules for Trezor from [here](https://trezor.io/learn/a/udev-rules).
1. In WSL2, run `sudo service udev restart`
1. In command prompt, run `winget install usbipd`
1. In command prompt, run `usbipd list` and look for the BUSID for `TREZOR`
1. In administrator command prompt, run `usbipd bind --busid=<BUSID>` with the BUSID from step (2).
1. In command prompt, run `usbipd attach --wsl --busid=<BUSID>` with the BUSID from step (2). **Note**: you will have to re-run this specific step every time you disconnect/reconnect the device
1. In WSL2, install `trezorctl` by following [this guide](https://trezor.io/learn/a/using-trezorctl-commands) (ignore the Trezor Bridge stuff)
1. In WSL2, run `lsusb` and see if Trezor appears to ensure the setup worked from the USB perspective
1. In WSL2, run `trezorctl list` to ensure the setup worked from the Trezor perspective

#### Commands to run

```bash
# Load the environment variables from the .env file
set -a  # automatically export all variables
source .env
set +a  # stop automatically exporting variables

yarn deploy:testnet
yarn deploy:mainnet
```
