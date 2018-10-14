# parity-dev-docker

A docker container to run a Parity DEV blockchain

## Getting started

Simple:

```
docker run -it -p 8545:8545 kauriorg/parity-docker
```

Complete example:

```
docker run -it \
	-p 8545:8545 \
	-p 8180:8180 \
	-v /home/user/.docker_parity_data:/root/.local/share/io.parity.ethereum \
	-v /home/user/.docker_partity_log:/data/parity-logs \
	-e TRANSFER_AMOUNT=10 \
	-e TRANSFER_ACCOUNTS=0xf0f15cedc719b5a55470877b0710d5c7816916b1,0x31b26E43651e9371C88aF3D36c14CfD938BaF4Fd \
	kauriorg/parity-docker
```

### Port

| Port | Description |
| -------- | -------- | 
| 8545 | JSON RPC | 
| 8180 | UI | 


### Volumes

| Name | Mandatory | Description |
| -------- | -------- | -------- |
| /root/.local/share/io.parity.ethereum  | no | Chain data | 
| /data/parity-logs | no | Logs | 


### Environment variables

| Name | Mandatory | Default | Description |
| -------- | -------- | -------- | -------- |
| TRANSFER_AMOUNT | no | 5 | Amount (in ether) to transfer to the `$ACCOUNTS`  |
| TRANSFER_ACCOUNTS | no |  | Accounts list (comma separated) to transfer from the miner  |



## Version

| Software | Version |
| -------- | -------- | 
| Parity | 2.1.2 | 
| web3 | latests | 