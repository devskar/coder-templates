FROM coder-base:0.2.2

# Install everything as root
USER root

# Creating the installation location for nvm
ENV NVM_DIR /usr/local/nvm
RUN mkdir -p $NVM_DIR

# Installing nvm with no node version
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN chown -R coder:coder $NVM_DIR

USER coder