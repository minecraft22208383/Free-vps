# Use official Ubuntu base image
FROM ubuntu:20.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    openssh-client \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install sshx from Replit GitHub release
RUN curl -sSf https://sshx.io/get | sh

# Run sshx (this will fail unless a token is provided, for testing run with a command override)
CMD ["sshx"]
