# From the base image (built on Docker host)
FROM coder-base:0.2.4

# Install everything as root
USER root

# Set environment variables 
ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH

# Install Rust
RUN curl -o /tmp/rustup.sh -sSf https://sh.rustup.rs && \
    chmod +x /tmp/rustup.sh
RUN /tmp/rustup.sh -y \
                   --no-modify-path \
                   --profile minimal \
                   --default-toolchain stable && \
    rm -f /tmp/rustup.sh && \
    chmod -R a+w ${RUSTUP_HOME} ${CARGO_HOME}

# Validate that cargo and rustc are available
RUN cargo --version && rustc --version
USER coder