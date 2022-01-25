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

{% if cookiecutter.install_gcc10_script.upper() == "YES" -%}
RUN sh scripts/install-gcc10.sh
{% endif %}

{% if cookiecutter.install_matplotpp_script.upper() == "YES" -%}
RUN sh scripts/install-matplotpp.sh
{% endif %}

{% if cookiecutter.install_catch2_script.upper() == "YES" -%}
RUN sh scripts/install-catch2.sh
{% endif %}

{% if cookiecutter.install_spdlog_script.upper() == "YES" -%}
RUN sh scripts/install-spdlog.sh
{% endif %}

{% if cookiecutter.install_json_script.upper() == "YES" -%}
RUN sh scripts/install-json.sh
{% endif %}

{% if cookiecutter.install_armadillo_scripts.upper() == "YES" -%}
RUN sh scripts/install-openblas-lapack.sh
RUN sh scripts/install-armadillo.sh
{% endif %}

{% if cookiecutter.install_arrrayfire_script.upper() == "YES" -%}
RUN sh scripts/install-arrayfire.sh
{% endif %}

{% if cookiecutter.install_itpp_script.upper() == "YES" -%}
RUN sh scripts/install-itpp.sh
{% endif %}


# Set the default shell to bash rather than sh
ENV SHELL /bin/zsh