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

```bash
yarn deploy:testnet
yarn deploy:mainnet
```
