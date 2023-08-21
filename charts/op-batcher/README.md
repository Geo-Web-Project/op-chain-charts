# OP Batcher

## Introduction

Please refer to the example values [here.](example-values/new-op-chain.yaml)

The default values were built according to the tutorial [here.](https://stack.optimism.io/docs/build/getting-started/)

## Install

`helm install op-node-release op-chain-charts/op-batcher -f values.yaml`

## Requirements

1. K8s 1.8+
2. Helm 3.2.0+
3. OP Rollup Node [op-node](../op-node/)

## Parameters

### Required Parameters

| Name            | Description                                                            | Value                               |
| --------------- | ---------------------------------------------------------------------- | ----------------------------------- |
| `l2.rpcAddr`    | An OP execution engine address that this OP Node can change the state. | `""`                                |
| `l2.rollupAddr` | Address of rollup node ([op-node](../op-node/))                        | `""`                                |
| `l2.batcherKey` | Private key of the batcher.                                            | `""`                                |
| `l1.rpcAddr`    | RPC address of your L2's L1.                                           | `"DSRV AllthatNode Goerli Network"` |

### OP Batcher Parameters

| Name   | Description                             | Value |
| ------ | --------------------------------------- | ----- |
| `args` | Other application arguments for op-node | `[]`  |

### Deployment Parameters

| Name                     | Description                          | Value     |
| ------------------------ | ------------------------------------ | --------- |
| `replicaCount`           | Number of op-node replicas to deploy | 1         |
| `livenessProbe`          | livenessProbe switch for op-node     | `true`    |
| `readinessProbe`         | readinessProbe switch for op-node    | `true`    |
| `rpc.port.containerPort` | Container port for RPC connections   | `8548`    |
| `rpc.port.hostPort`      | Host port for RPC connections        | `8548`    |
| `rpc.addr`               | Listening address for RPC            | `0.0.0.0` |

### Common Parameters

| Name               | Description                                              | Value         |
| ------------------ | -------------------------------------------------------- | ------------- |
| `fullnameOverride` | String to fully override op-node.fullname template       | `""`          |
| `nameOverride`     | String to fully override op-node.name                    | `""`          |
| `service.type`     | Service type                                             | `"ClusterIP"` |
| `resources`        | The resources limits for the op-node                     | `{}`          |
| `nodeSelector`     | Node labels for pod assignment. Evaluated as a template. | `{}`          |
| `tolerations`      | Tolerations for pod assignment. Evaluated as a template. | `[]`          |
| `affinity`         | Affinity for pod assignment                              | `{}`          |
