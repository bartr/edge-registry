# Edge Docker Registry

## Introduction

Edge Docker Registry

## Prerequisites

- GitHub Codespaces access
  - You should have this as a member of cse-labs
  - Ping bartr if you have access issues

## Create a Codespace

- Create a Codespace from this repo.

- Click the `<> Code` button
  - Make sure the Codespaces tab is active
- Click `Create Codespace on main`
- After about 5 minutes, you will have a GitHub Codespace running with a complete Kubernetes Developer Experience!

## Getting Started

```bash

# create local registry
k3d registry create registry.localhost --port 5000

# download heartbeat container
docker pull ghcr.io/cse-labs/heartbeat:0.4.0

# tag the container
docker tag ghcr.io/cse-labs/heartbeat:0.4.0 registry.localhost:5000/heartbeat:0.4.0

# push the container
docker push registry.localhost:5000/heartbeat:0.4.0

# Create cluster
k3d cluster create \
    --k3s-arg --disable=traefik@server:0 \
    --registry-use k3d-registry.localhost:5000 \
    -p 30080:30080@server:0 \
    -p 80:80@loadbalancer

# Deploy heartbeat
kubectl apply -k ./heartbeat/base

# Check heartbeat
curl -i localhost/heartbeat/16

```

## Support

This project uses GitHub Issues to track bugs and feature requests. Please search the existing issues before filing new issues to avoid duplicates.  For new issues, file your bug or feature request as a new issue.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general). Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship. Any use of third-party trademarks or logos are subject to those third-party's policies.
