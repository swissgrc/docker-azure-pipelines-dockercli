# Docker image for running and building Docker images in an Azure Pipelines container job

<!-- markdownlint-disable MD013 -->
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dockercli/blob/main/LICENSE) [![Build](https://img.shields.io/github/actions/workflow/status/swissgrc/docker-azure-pipelines-dockercli/publish.yml?branch=develop&style=flat-square)](https://github.com/swissgrc/docker-azure-pipelines-dockercli/actions/workflows/publish.yml) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=swissgrc_docker-azure-pipelines-dockercli&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=swissgrc_docker-azure-pipelines-dockercli) [![Pulls](https://img.shields.io/docker/pulls/swissgrc/azure-pipelines-dockercli.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dockercli) [![Stars](https://img.shields.io/docker/stars/swissgrc/azure-pipelines-dockercli.svg?style=flat-square)](https://hub.docker.com/r/swissgrc/azure-pipelines-dockercli)
<!-- markdownlint-restore -->

Docker image to run and build Docker images in [Azure Pipelines container jobs].
The image contains Docker CLI and Docker Compose to access Docker engine on the agent.

## Usage

This image can be used to run and build Docker images in [Azure Pipelines container jobs].

### Azure Pipelines Container Job

To use the image in an Azure Pipelines Container Job, add one of the following example tasks and use it with the `container` property.

The following example shows the container used for a deployment step which shows Docker CLI version:

```yaml
  - stage: deploy
    jobs:
      - deployment: runDotNet
        container: swissgrc/azure-pipelines-dockercli:latest
        environment: smarthotel-dev
        strategy:
          runOnce:
            deploy:
              steps:
                - bash: |
                    docker --version
```

### Included Software
- Docker CLI
- Docker Compose
- BuildX

### Tags

| Tag        | Description                                       | Size                                                                                                                               |
|------------|---------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| latest     | Latest stable release (from `main` branch)        | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/latest?style=flat-square)   |
| unstable   | Latest unstable release (from `develop` branch)   | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/unstable?style=flat-square) |
| x.y.z     | Image for a specific version of Docker CLI         |                                                                                                                                    |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
