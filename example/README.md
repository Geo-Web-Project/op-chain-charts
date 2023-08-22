# OP Chain Helmfile

This is an example of using the op-chain-charts with Helmfile. It will deploy all components along with a [Blockscout](https://www.blockscout.com) instance.

## Configuration

It is recommended to follow the tutorial [here](https://stack.optimism.io/docs/build/getting-started/) and fill in the missing values in the Helmfiles.

### genesis.json

The `genesis.json` file needs to be uploaded somewhere that can be access over HTTP. The `op-geth` deployment will attempt to download the genesis file on the first launch.

### rollup.json

The `rollup.json` file that is generated from the tutorial can be added to [helmfile.yaml](./helmfile.yaml). It will be attached as a ConfigMap.
