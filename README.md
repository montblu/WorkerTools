# WorkerTools

Custom lightweight Octopus Deploy worker tools Docker image.

## Overview

Inspired by [OctopusDeploy/worker-tools](https://github.com/OctopusDeploy/WorkerTools), this is a minimal image with only the tools we need.

## Why This Image?

The official image is comprehensive but large (4.94 GB). We built this from scratch to be:
- **Smaller**: 598 MB (88% reduction)
- **Focused**: Only our required tools
- **Simpler**: Easier to maintain

## Comparison

| Image | Size |
|-------|------|
| octopusdeploy/worker-tools:6.1.0-ubuntu.22.04 | 4.94 GB |
| ghcr.io/montblu/workertools:0.1.0 | 598 MB |

**We stripped out everything we didn't need and only added the tools we required.**

## Tools

### Core Tools

- AWS CLI v2.31.18
- Helm v3.19.5
- Kubectl v1.33.7

### System Utilities

- curl
- jq
- parallel
- xxd

## Usage

```bash
# Pull
docker pull ghcr.io/montblu/workertools:0.1.0

# Build
docker build -t worker-tools .
```

## Acknowledgments

Inspired by [OctopusDeploy/worker-tools](https://github.com/OctopusDeploy/WorkerTools). For a full-featured image, use the official one.
