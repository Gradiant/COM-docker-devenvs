# Dockerfile
#
# Maintainer Andrés Ferreiro González (aferreiro@gradiant.org)
#
# Created @ Tuesday, 25th January 2022 1:27:22 pm
# Copyright (c) 2022 GRADIANT
# All Rights Reserved

FROM ubuntu:focal

ARG USERNAME="vscode"
ARG USER_UID="1000"

# Create the non-root user
RUN useradd --uid ${USER_UID} -rm -d /home/${USERNAME} -g root -G sudo ${USERNAME} \
  # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
  && apt-get update \
  && apt-get install -y -qq apt-utils build-essential sudo \
  && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
  && chmod 0440 /etc/sudoers.d/${USERNAME}

# Install dev dependencies
COPY scripts scripts
RUN apt-get update -qq && export DEBIAN_FRONTEND=noninteractive && apt-get upgrade -y -qq \
  && apt-get install -y -qq sudo git curl wget htop nano python3 zsh bat cmake \
  && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
  {% if cookiecutter.add_gcc10_install_script.upper() == "YES" -%}
&& sh scripts/install-gcc10.sh \
  {% endif -%}
{%- if cookiecutter.add_armadillo_install_scripts.upper() == "YES" -%}
&& sh scripts/install-openblas-lapack.sh \
  && sh scripts/install-armadillo.sh \
  {% endif -%}
{%- if cookiecutter.add_arrayfire_install_script.upper() == "YES" -%}
&& sh scripts/install-arrayfire.sh \
  {% endif -%}
{%- if cookiecutter.add_matplotpp_install_script.upper() == "YES" -%}
&& sh scripts/install-matplotpp.sh \
  {% endif -%}
{%- if cookiecutter.add_catch2_install_script.upper() == "YES" -%}
&& sh scripts/install-catch2.sh \
  {% endif -%}
{%- if cookiecutter.add_spdlog_install_script.upper() == "YES" -%}
&& sh scripts/install-spdlog.sh \
  {% endif -%}
{%- if cookiecutter.add_json_install_script.upper() == "YES" -%}
&& sh scripts/install-json.sh \
  {% endif -%}
{%- if cookiecutter.add_itpp_install_script.upper() == "YES" -%}
&& sh scripts/install-itpp.sh \
  {% endif -%}
{%- if cookiecutter.add_pybind11_install_script.upper() == "YES" -%}
&& sh scripts/install-pybind11.sh \
  {% endif -%}
{%- if cookiecutter.add_gdal_install_scripts.upper() == "YES" -%}
&& sh scripts/install-proj.sh \
  && sh scripts/install-gdal.sh \
  {% endif -%}
{%- if cookiecutter.add_geographiclib_install_script.upper() == "YES" -%}
&& sh scripts/install-geographiclib.sh \
  {% endif -%}
&& apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

COPY conf/.zshrc /root
COPY conf/custom.zsh-theme /root/.oh-my-zsh/custom/themes

# Configure ZSH for non-root user
WORKDIR /home/${USERNAME}
USER ${USERNAME}

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/${USERNAME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /home/${USERNAME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions

COPY conf/.zshrc /home/${USERNAME}
COPY conf/custom.zsh-theme /home/${USERNAME}/.oh-my-zsh/custom/themes

# Set the default shell to bash rather than sh
ENV SHELL /bin/zsh

# Set root as default user
USER root