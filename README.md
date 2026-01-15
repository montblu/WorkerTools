# WorkerTools

Custom lightweight Octopus Deploy worker tools Docker image.

## Overview

Inspired by [OctopusDeploy/worker-tools](https://github.com/OctopusDeploy/WorkerTools), this is a minimal image with only the tools we need.

## Why This Image?

The official image is comprehensive but large (6.06 GB). We built this from scratch to be:
- **Smaller**: 638 MB (90% reduction)
- **Focused**: Only our required tools
- **Simpler**: Easier to maintain

## Tools

### Core Tools

- AWS CLI v2.31.18
- Helm v3.19.5
- Kubectl v1.33.7

### System Utilities

- curl
- jq
- parallel
- unzip
- wget
- xxd

## Usage

```bash
# Pull
docker pull ghcr.io/montblu/worker-tools:latest

# Build
docker build -t worker-tools .
```

## Acknowledgments

Inspired by [OctopusDeploy/worker-tools](https://github.com/OctopusDeploy/WorkerTools). For a full-featured image, use the official one.
