FROM ubuntu:22.04

# Add devuser to sudoers

# Install sudo and set up user
RUN apt-get update && apt-get install -y sudo \
    && echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/*

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential git curl wget unzip cmake ninja-build \
    python3 python3-pip pkg-config zlib1g-dev ca-certificates \
    libssl-dev libelf-dev libudev-dev libpci-dev libiberty-dev \
    flex bison libncurses-dev gawk openssl bc rsync cpio zstd \
    dkms linux-headers-generic software-properties-common && \
    rm -rf /var/lib/apt/lists/*

# Install virtme-ng for kernel testing
RUN python3 -m pip install virtme-ng

# Add LLVM apt repo & install LLVM 19 toolchain
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo tee /etc/apt/trusted.gpg.d/llvm.asc && \
    echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-19 main" | \
      tee /etc/apt/sources.list.d/llvm19.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    clang-19 lld-19 lldb-19 llvm-19 llvm-19-dev libclang-19-dev libllvm19 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-19 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-19 100 && \
    update-alternatives --install /usr/bin/ld.lld ld.lld /usr/bin/ld.lld-19 100 && \
    update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-19 100 && \
    rm -rf /var/lib/apt/lists/*

# Install Rust toolchain (stable)
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable && \
    echo 'source $HOME/.cargo/env' >> /root/.bashrc

# Set up Rust environment and install tools
RUN /bin/bash -c "source /root/.cargo/env && \
    rustup component add rust-src rustfmt clippy && \
    cargo install --locked bindgen-cli"

# Environment variables to use LLVM 19 consistently
ENV PATH="/root/.cargo/bin:$PATH"
ENV CC=clang
ENV CXX=clang++
ENV LD=ld.lld

# Create workspace directory
RUN mkdir -p /workspace
WORKDIR /workspace

# Non-root devuser
RUN useradd -m -s /bin/bash devuser && \
    chown -R devuser:devuser /workspace
USER devuser
ENV PATH="/home/devuser/.cargo/bin:$PATH"

# Install Rust for devuser
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable && \
    echo 'source $HOME/.cargo/env' >> /home/devuser/.bashrc

RUN /bin/bash -c "source /home/devuser/.cargo/env && \
    rustup component add rust-src rustfmt clippy && \
    cargo install --locked bindgen-cli"
