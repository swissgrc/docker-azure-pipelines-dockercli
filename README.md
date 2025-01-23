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

### Tags

| Tag        | Description                                                                  | Base Image       | Docker CLI | Docker Compose | BuildX | Size                                                                                                                               |
|------------|------------------------------------------------------------------------------|------------------|------------|----------------|--------|------------------------------------------------------------------------------------------------------------------------------------|
| latest     | Latest stable release (from `main` branch)                                   | debian:12.9-slim | 27.5.1     | 2.32.4         | 0.20.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/latest?style=flat-square)   |
| unstable   | Latest unstable release (from `develop` branch)                              | debian:12.9-slim | 27.5.1     | 2.32.4         | 0.20.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/unstable?style=flat-square) |
| 24.0.0     | [Docker CLI 24.0.0](https://docs.docker.com/engine/release-notes/24.0/#2400) | debian:11.7-slim | 24.0.0     | 2.18.1         | 0.10.4 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.0?style=flat-square)   |
| 24.0.1     | [Docker CLI 24.0.1](https://docs.docker.com/engine/release-notes/24.0/#2401) | debian:11.7-slim | 24.0.1     | 2.18.1         | 0.10.4 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.1?style=flat-square)   |
| 24.0.2     | [Docker CLI 24.0.2](https://docs.docker.com/engine/release-notes/24.0/#2402) | debian:11.7-slim | 24.0.2     | 2.18.1         | 0.10.5 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.2?style=flat-square)   |
| 24.0.3     | [Docker CLI 24.0.3](https://docs.docker.com/engine/release-notes/24.0/#2403) | debian:12.0-slim | 24.0.3     | 2.19.1         | 0.11.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.3?style=flat-square)   |
| 24.0.4     | [Docker CLI 24.0.4](https://docs.docker.com/engine/release-notes/24.0/#2404) | debian:12.0-slim | 24.0.4     | 2.19.1         | 0.11.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.4?style=flat-square)   |
| 24.0.5     | [Docker CLI 24.0.5](https://docs.docker.com/engine/release-notes/24.0/#2405) | debian:12.0-slim | 24.0.5     | 2.20.2         | 0.11.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.5?style=flat-square)   |
| 24.0.6     | [Docker CLI 24.0.6](https://docs.docker.com/engine/release-notes/24.0/#2406) | debian:12.1-slim | 24.0.6     | 2.21.0         | 0.11.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.6?style=flat-square)   |
| 24.0.7     | [Docker CLI 24.0.7](https://docs.docker.com/engine/release-notes/24.0/#2407) | debian:12.2-slim | 24.0.7     | 2.21.0         | 0.11.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/24.0.7?style=flat-square)   |
| 25.0.0     | [Docker CLI 25.0.0](https://docs.docker.com/engine/release-notes/25.0/#2500) | debian:12.4-slim | 25.0.0     | 2.24.1         | 0.12.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/25.0.0?style=flat-square)   |
| 25.0.3     | [Docker CLI 25.0.3](https://docs.docker.com/engine/release-notes/25.0/#2503) | debian:12.4-slim | 25.0.3     | 2.24.2         | 0.12.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/25.0.3?style=flat-square)   |
| 25.0.4     | [Docker CLI 25.0.4](https://docs.docker.com/engine/release-notes/25.0/#2504) | debian:12.5-slim | 25.0.4     | 2.24.7         | 0.13.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/25.0.4?style=flat-square)   |
| 25.0.5     | [Docker CLI 25.0.5](https://docs.docker.com/engine/release-notes/25.0/#2505) | debian:12.5-slim | 25.0.5     | 2.24.7         | 0.13.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/25.0.5?style=flat-square)   |
| 26.0.0     | [Docker CLI 26.0.0](https://docs.docker.com/engine/release-notes/26.0/#2600) | debian:12.5-slim | 26.0.0     | 2.25.0         | 0.13.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.0.0?style=flat-square)   |
| 26.0.1     | [Docker CLI 26.0.1](https://docs.docker.com/engine/release-notes/26.0/#2601) | debian:12.5-slim | 26.0.1     | 2.26.1         | 0.13.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.0.1?style=flat-square)   |
| 26.0.2     | [Docker CLI 26.0.2](https://docs.docker.com/engine/release-notes/26.0/#2602) | debian:12.5-slim | 26.0.2     | 2.26.1         | 0.14.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.0.2?style=flat-square)   |
| 26.1.0     | [Docker CLI 26.1.0](https://docs.docker.com/engine/release-notes/26.1/#2610) | debian:12.5-slim | 26.1.0     | 2.26.1         | 0.14.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.1.0?style=flat-square)   |
| 26.1.1     | [Docker CLI 26.1.1](https://docs.docker.com/engine/release-notes/26.1/#2611) | debian:12.5-slim | 26.1.1     | 2.27.0         | 0.14.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.1.1?style=flat-square)   |
| 26.1.2     | [Docker CLI 26.1.2](https://docs.docker.com/engine/release-notes/26.1/#2612) | debian:12.5-slim | 26.1.2     | 2.27.0         | 0.14.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.1.2?style=flat-square)   |
| 26.1.3     | [Docker CLI 26.1.3](https://docs.docker.com/engine/release-notes/26.1/#2613) | debian:12.5-slim | 26.1.3     | 2.27.0         | 0.14.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.1.3?style=flat-square)   |
| 26.1.4     | [Docker CLI 26.1.4](https://docs.docker.com/engine/release-notes/26.1/#2614) | debian:12.5-slim | 26.1.4     | 2.27.1         | 0.14.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/26.1.4?style=flat-square)   |
| 27.0.1     | [Docker CLI 27.0.1](https://docs.docker.com/engine/release-notes/27/#2701)   | debian:12.5-slim | 27.0.1     | 2.28.1         | 0.15.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.0.1?style=flat-square)   |
| 27.0.2     | [Docker CLI 27.0.2](https://docs.docker.com/engine/release-notes/27/#2702)   | debian:12.6-slim | 27.0.2     | 2.28.1         | 0.15.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.0.2?style=flat-square)   |
| 27.1.1     | [Docker CLI 27.1.1](https://docs.docker.com/engine/release-notes/27/#2711)   | debian:12.6-slim | 27.1.1     | 2.29.1         | 0.16.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.1.1?style=flat-square)   |
| 27.1.2     | [Docker CLI 27.1.2](https://docs.docker.com/engine/release-notes/27/#2712)   | debian:12.6-slim | 27.1.2     | 2.29.1         | 0.16.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.1.2?style=flat-square)   |
| 27.2.0     | [Docker CLI 27.2.0](https://docs.docker.com/engine/release-notes/27/#2720)   | debian:12.6-slim | 27.2.0     | 2.29.2         | 0.16.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.2.0?style=flat-square)   |
| 27.2.1     | [Docker CLI 27.2.1](https://docs.docker.com/engine/release-notes/27/#2721)   | debian:12.7-slim | 27.2.1     | 2.29.2         | 0.16.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.2.1?style=flat-square)   |
| 27.3.0     | [Docker CLI 27.3.0](https://docs.docker.com/engine/release-notes/27/#2730)   | debian:12.7-slim | 27.3.0     | 2.29.6         | 0.17.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.3.0?style=flat-square)   |
| 27.3.1     | [Docker CLI 27.3.1](https://docs.docker.com/engine/release-notes/27/#2731)   | debian:12.7-slim | 27.3.1     | 2.29.1         | 0.17.1 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.3.1?style=flat-square)   |
| 27.4.0     | [Docker CLI 27.4.0](https://docs.docker.com/engine/release-notes/27/#2740)   | debian:12.8-slim | 27.4.0     | 2.31.0         | 0.19.2 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.4.0?style=flat-square)   |
| 27.4.1     | [Docker CLI 27.4.1](https://docs.docker.com/engine/release-notes/27/#2741)   | debian:12.8-slim | 27.4.1     | 2.32.1         | 0.19.3 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.4.1?style=flat-square)   |
| 27.5.0     | [Docker CLI 27.5.0](https://docs.docker.com/engine/release-notes/27/#2750)   | debian:12.9-slim | 27.5.0     | 2.32.3         | 0.19.3 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.5.0?style=flat-square)   |
| 27.5.1     | [Docker CLI 27.5.1](https://docs.docker.com/engine/release-notes/27/#2751)   | debian:12.9-slim | 27.5.1     | 2.32.4         | 0.20.0 | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/swissgrc/azure-pipelines-dockercli/27.5.1?style=flat-square)   |

[Azure Pipelines container jobs]: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases
