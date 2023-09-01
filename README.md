# sui-smart-contracts

## Setup
### 1. Install SUI binaries 
Use the latest release as the tag
```bash
rustup update stable && cargo install --locked --git https://github.com/MystenLabs/sui.git --tag mainnet-v1.8.2 sui
```
### 2. Generate deployer wallet
*wip*
### 3. Add RPC
```bash
sui client new-env --alias mainnet-ankr --rpc https://rpc.ankr.com:443/sui
sui client switch --env mainnet-ankr
```
### 4. Deploy 
For example deploy of liquid_staking package
```bash
sui client publish --gas-budget 300000000 liquid_staking
```