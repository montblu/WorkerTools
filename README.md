# WorkerTools

Custom lightweight Octopus Deploy worker tools Docker image.

## Overview

Inspired by [OctopusDeploy/worker-tools](https://github.com/OctopusDeploy/WorkerTools), this is a minimal image with only the tools we need.

## Why This Image?

The official image is comprehensive but large (6.06 GB). We built this from scratch to be:
- **Smaller**: 1.08 GB (82% reduction)
- **Focused**: Only our required tools
- **Simpler**: Easier to maintain

## Tools

- .NET SDK 8.0
- kubectl v1.33.7
- Helm v3.19.5
- AWS CLI v2.31.18

## Usage

```bash
# Pull
docker pull ghcr.io/<username>/worker-tools:latest

# Build
docker build -t worker-tools .
```

## Acknowledgments

Inspired by [OctopusDeploy/worker-tools](https://github.com/OctopusDeploy/WorkerTools). For a full-featured image, use the official one.
