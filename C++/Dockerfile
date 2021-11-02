# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.183.0/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version: debian-10, debian-9, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

WORKDIR /home/vscode

COPY scripts scripts

# avoid warnings by switching to noninteractive
RUN export DEBIAN_FRONTEND=noninteractive && sudo apt-get update -qq && sudo apt-get upgrade -y -qq \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /home/vscode/.oh-my-zsh/custom/plugins/zsh-autosuggestions

COPY conf/.zshrc /home/vscode
COPY conf/custom.zsh-theme /home/vscode/.oh-my-zsh/custom/themes

RUN sh scripts/install-gcc10.sh
RUN sh scripts/install-matplotpp.sh
RUN sh scripts/install-catch2.sh
RUN sh scripts/install-spdlog.sh
RUN sh scripts/install-json.sh
RUN sh scripts/install-openblas-lapack.sh
RUN sh scripts/install-armadillo.sh
RUN sh scripts/install-arrayfire.sh
RUN sh scripts/install-itpp.sh

RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.zsh_history" \
  && mkdir /commandhistory \
  && touch /commandhistory/.zsh_history \
  && sudo chown -R vscode /commandhistory \
  && echo $SNIPPET >> "/home/vscode/.zshrc"

# Set the default shell to bash rather than sh
ENV SHELL /bin/zsh