# Op Geth

Geth is an execution engine for EVM network. This is a OP Geth Helm Chart forked from [Test in Prod](https://github.com/testinprod-io/op-charts/tree/main/charts/op-node) in order to support customization of OP Stack chains.

## Introduction

Please refer to the example values [here.](example-values/new-op-chain.yaml)

The default values were built according to the tutorial [here.](https://stack.optimism.io/docs/build/getting-started/)

## Install

`helm install op-geth-release op-chain-charts/op-geth -f values.yaml`

## Requirements

1. K8s 1.8+
2. Helm 3.2.0+

## Parameters

### Op Geth Parameters

| Name                     | Description                                                                                | Value                                                                |
| ------------------------ | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- |
| `rpc.http.enabled`       | HTTP RPC switch                                                                            | `true`                                                               |
| `rpc.http.api`           | API list for HTTP RPC                                                                      | `"net,eth,personal,web3,debug,engine,txpool"`                        |
| `rpc.ws.enabled`         | WS RPC switch                                                                              | `true`                                                               |
| `rpc.ws.api`             | API list for WS RPC                                                                        | `"net,eth,personal,web3,engine,txpool"`                              |
| `authrpc.enabled`        | Auth RPC switch                                                                            | `true`                                                               |
| `authrpc.jwtSecret.file` | JWT Secret key for Auth RPC. **PLEASE change this value** if you are going to use AuthRPC. | `"abf3a433bfe1f8faa262ad82b3ec5fa572e9c045a4c44bd3b21998e77fd3632a"` |
| `pprof.enabled`          | pprof switch                                                                               | `true`                                                               |
| `metrics.enabled`        | metrics switch                                                                             | `true`                                                               |
| `dataPath`               | Path for the Geth DB.                                                                      | `"/data"`                                                            |
| `networkID`              | Network ID                                                                                 | `1`                                                                  |
| `maxPeers`               | Max list of peers.                                                                         | `50`                                                                 |
| `syncMode`               | Method for syncing. Choices are `snap` and `full`.                                         | `"snap"`                                                             |
| `args`                   | Other application arguments for op-node                                                    | `[]`                                                                 |

### Deployment Parameters

| Name                          | Description                                                                          | Value     |
| ----------------------------- | ------------------------------------------------------------------------------------ | --------- |
| `replicaCount`                | Number of op-node replicas to deploy                                                 | 1         |
| `livenessProbe`               | livenessProbe switch for op-node                                                     | `true`    |
| `readinessProbe`              | readinessProbe switch for op-node                                                    | `true`    |
| `rpc.http.port.containerPort` | Container port for HTTP RPC connections                                              | `8545`    |
| `rpc.http.port.hostPort`      | Host port for HTTP RPC connections                                                   | `8545`    |
| `rpc.http.addr`               | Listening address for HTTP RPC                                                       | `0.0.0.0` |
| `rpc.ws.port.containerPort`   | Container port for WS RPC connections                                                | `8546`    |
| `rpc.ws.port.hostPort`        | Host port for WS RPC connections                                                     | `8546`    |
| `rpc.ws.addr`                 | Listening address for WS RPC                                                         | `0.0.0.0` |
| `authrpc.port.containerPort`  | AuthRPC container port                                                               | `8551`    |
| `authrpc.port.hostPort`       | AuthRPC host port                                                                    | `8551`    |
| `authrpc.addr`                | AuthRPC listening address                                                            | `0.0.0.0` |
| `pprof.port.containerPort`    | pprof container port                                                                 | `6060`    |
| `pprof.port.hostPort`         | pprof host port                                                                      | `6060`    |
| `pprof.addr`                  | pprof listening address                                                              | `0.0.0.0` |
| `metrics.port.containerPort`  | metrics container port                                                               | `7300`    |
| `metrics.port.hostPort`       | metrics host port                                                                    | `7300`    |
| `metrics.addr`                | metrics listening address                                                            | `0.0.0.0` |
| `persistence.size`            | persistence disk size. Recommending 2TB+ for mainnet and 200GB+ for Optimism Goerli. | `200Gi`   |

### Common Parameters

| Name               | Description                                              | Value            |
| ------------------ | -------------------------------------------------------- | ---------------- |
| `fullnameOverride` | String to fully override op-node.fullname template       | `""`             |
| `nameOverride`     | String to fully override op-node.name                    | `""`             |
| `service.type`     | Service type                                             | `"LoadBalancer"` |
| `resources`        | The resources limits for the op-node                     | `{}`             |
| `nodeSelector`     | Node labels for pod assignment. Evaluated as a template. | `{}`             |
| `tolerations`      | Tolerations for pod assignment. Evaluated as a template. | `[]`             |
| `affinity`         | Affinity for pod assignment                              | `{}`             |
