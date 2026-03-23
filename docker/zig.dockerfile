FROM alpine:latest

# Install build dependencies
RUN apk add --no-cache curl

# Install Zig
ARG ZIG_VERSION=0.16.0-dev.2694+74f361a5c
ARG ZIG_ARCH=x86_64-linux
RUN curl -L "https://ziglang.org/builds/zig-${ZIG_ARCH}-${ZIG_VERSION}.tar.xz" | tar -xJ -C /opt/ && \
    ln -s /opt/zig-${ZIG_ARCH}-${ZIG_VERSION}/zig /usr/local/bin/zig

ENV PATH="/opt/zig-${ZIG_ARCH}-${ZIG_VERSION}:${PATH}"

WORKDIR /app
