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
RUN curl -fsSL https://github.com/replit/sshx/releases/latest/download/sshx-linux -o /usr/local/bin/sshx && \
    chmod +x /usr/local/bin/sshx

# Run sshx (this will fail unless a token is provided, for testing run with a command override)
CMD ["sshx"]
