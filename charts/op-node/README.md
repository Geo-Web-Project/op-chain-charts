# OP Node

OP Node is a consensus engine for OP Stack. This is a OP Node Helm Chart forked from [Test in Prod](https://github.com/testinprod-io/op-charts/tree/main/charts/op-node) in order to support customization of OP Stack chains.

## Introduction

You can build a new OP Stack chain or connect to an existing one. You need an OP execution engine that works along with OP Node.

Please refer to the example values [here.](example-values/new-op-chain.yaml)

The default values were built according to the tutorial [here.](https://stack.optimism.io/docs/build/getting-started/)

## Install

`helm install op-node-release op-chain-charts/op-node -f values.yaml`

## Requirements

1. K8s 1.8+
2. Helm 3.2.0+
3. OP Execution Engine with EngineAPI access like [op-geth](../op-geth/)

## Parameters

### Required Parameters

| Name           | Description                                                                | Value                               |
| -------------- | -------------------------------------------------------------------------- | ----------------------------------- |
| `l2.rpcAddr`   | An OP execution engine address that this OP Node can change the state.     | `""`                                |
| `l2.jwtSecret` | jwtSecret key that has an admin permission to the execution engine client. | `""`                                |
| `l1.rpcAddr`   | RPC address of your L2's L1.                                               | `"DSRV AllthatNode Goerli Network"` |

### OP Node Parameters

| Name                | Description                                                                          | Value   |
| ------------------- | ------------------------------------------------------------------------------------ | ------- |
| `sequencer.enabled` | If this op-node will work as a sequencer or not.                                     | `false` |
| `sequencer.p2pKey`  | A key that op-node will sign as a sequencer upon p2p sync                            | `""`    |
| `p2p.enabled`       | p2p switch                                                                           | `true`  |
| `rollupConfig.file` | A JSON that has rollup's rollup params. This should not be used with `network` param | `""`    |
| `metrics.enabled`   | Prometheus switch for the metrics                                                    | `true`  |
| `args`              | Other application arguments for op-node                                              | `[]`    |

### Deployment Parameters

| Name                           | Description                            | Value     |
| ------------------------------ | -------------------------------------- | --------- |
| `replicaCount`                 | Number of op-node replicas to deploy   | 1         |
| `livenessProbe`                | livenessProbe switch for op-node       | `true`    |
| `readinessProbe`               | readinessProbe switch for op-node      | `true`    |
| `rpc.port.containerPort`       | Container port for RPC connections     | `8547`    |
| `rpc.port.hostPort`            | Host port for RPC connections          | `8547`    |
| `rpc.addr`                     | Listening address for RPC              | `0.0.0.0` |
| `p2p.listen.ip`                | p2p listening address                  | `0.0.0.0` |
| `p2p.listen.tcp.containerPort` | p2p container port for TCP connections | `9003`    |
| `p2p.listen.tcp.hostPort`      | p2p host port for TCP connections      | `9003`    |
| `p2p.listen.udp.containerPort` | p2p container port for UDP connections | `9003`    |
| `p2p.listen.udp.hostPort`      | p2p host port for UDP connections      | `9003`    |
| `metrics.port.containerPort`   | Container port for metrics connections | `7300`    |
| `metrics.port.hostPort`        | Host port for metrics connections      | `7300`    |
| `metrics.addr`                 | Listening address for metrics          | `0.0.0.0` |
| `pprof.port.containerPort`     | Container port for pprof connections   | `6060`    |
| `pprof.port.hostPort`          | Host port for pprof connections        | `6060`    |
| `pprof.addr`                   | Listening address for pprof            | `0.0.0.0` |

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
