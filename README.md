# OP Chain Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/op-chain-charts)](https://artifacthub.io/packages/search?repo=op-chain-charts)

This repository contains helm charts for deploying a new OP Chain. It was originally forked from [op-charts](https://github.com/testinprod-io/op-charts), which is a great resource for deploying Optimism Network nodes. This project expands on this to specifically support deploying entirely new OP Chains.

## Install

```
helm repo add op-chain-charts https://geo-web-project.github.io/op-chain-charts/
```

## Helmfile Example

An example Helmfile for deploying all these components together can be found [here](./example/).
