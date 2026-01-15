FROM debian:12-slim as installer

ENV DEBIAN_FRONTEND=noninteractive \
  AWS_CLI_VERSION=2.31.18 \
  HELM_VERSION=v3.19.5 \
  KUBECTL_VERSION=1.33.7

RUN apt-get update &&\
    apt-get install -y \
      curl \
      unzip

# Install AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
RUN curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip" -o /tmp/awscliv2.zip && \
    unzip -q /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install

# Install Helm
# https://helm.sh/docs/intro/install/#from-the-binary-releases
RUN curl -fsSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xzf - -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm

# Install Kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#from-binary
RUN curl -fsSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    chmod +x /usr/local/bin/kubectl


FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

# Update and install base dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      jq \
      libicu-dev \
      parallel \
      xxd && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf \
      /tmp/* \
      /usr/share/doc \
      /usr/share/info \
      /usr/share/man \
      /var/cache/* \
      /var/lib/apt/lists/* \
      /var/log/* \
      /var/tmp/*

COPY --from=installer /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=installer /usr/local/bin /usr/local/bin/
