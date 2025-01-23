# Base image containing dependencies used in builder and final image
FROM debian:12.9-slim AS base

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# renovate: datasource=repology depName=debian_12/ca-certificates versioning=loose
ENV CACERTIFICATES_VERSION=20230311

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends ca-certificates=${CACERTIFICATES_VERSION} && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


# Builder image
FROM base AS build

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# renovate: datasource=repology depName=debian_12/curl versioning=deb
ENV CURL_VERSION=7.88.1-10+deb12u8
# renovate: datasource=repology depName=debian_12/lsb-release versioning=deb
ENV LSBRELEASE_VERSION=12.0-1
# renovate: datasource=repology depName=debian_12/gnupg2 versioning=deb
ENV GNUPG_VERSION=2.2.40-1.1

RUN apt-get update -y && \
  # Install necessary dependencies
  apt-get install -y --no-install-recommends \
    curl=${CURL_VERSION} \
    gnupg=${GNUPG_VERSION} \
    lsb-release=${LSBRELEASE_VERSION} && \
  # Add Dockers public key
  mkdir -p /etc/apt/keyrings && \
  curl --proto "=https" -fsSL https://download.docker.com/linux/debian/gpg \
    | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  # Add Dockers APT repository to the list of sources
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list \
    > /dev/null && \
  rm -rf /tmp/*

# Final image
FROM base AS final

LABEL org.opencontainers.image.vendor="Swiss GRC AG"
LABEL org.opencontainers.image.authors="Swiss GRC AG <opensource@swissgrc.com>"
LABEL org.opencontainers.image.title="azure-pipelines-dockercli"
LABEL org.opencontainers.image.documentation="https://github.com/swissgrc/docker-azure-pipelines-dockercli"

# Make sure to fail due to an error at any stage in shell pipes
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /
# Copy Docker keyring
COPY --from=build /etc/apt/keyrings/ /etc/apt/keyrings
COPY --from=build /etc/apt/sources.list.d/ /etc/apt/sources.list.d

# Install Docker CLI

# renovate: datasource=github-tags depName=docker/cli extractVersion=^v(?<version>.*)$
ENV DOCKERCLI_VERSION=27.5.1
# renovate: datasource=github-tags depName=docker/buildx extractVersion=^v(?<version>.*)$
ENV DOCKERBUILDX_VERSION=0.19.3
# renovate: datasource=github-tags depName=docker/compose extractVersion=^v(?<version>.*)$
ENV DOCKERCOMPOSE_VERSION=2.32.4

RUN apt-get update -y && \
  # Install Docker CLI
  apt-get install -y --no-install-recommends \
    docker-buildx-plugin=${DOCKERBUILDX_VERSION}-1~debian.12~bookworm \
    docker-ce-cli=5:${DOCKERCLI_VERSION}-1~debian.12~bookworm \
    docker-compose-plugin=${DOCKERCOMPOSE_VERSION}-1~debian.12~bookworm && \
  # Clean up
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # Smoke test
  docker --version && \
  docker buildx version && \
  docker compose version

# Add Docker plugins to path
ENV PATH="$PATH:/usr/libexec/docker/cli-plugins"
# Smoke test
RUN echo "$PATH" && \
  docker-buildx version && \
  docker-compose version
