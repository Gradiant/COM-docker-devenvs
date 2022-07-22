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
ARG USER_GID=${USER_UID}

# Create the user
RUN groupadd --gid ${USER_GID} ${USERNAME} \
  && useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
  #
  # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
  && apt-get update && export DEBIAN_FRONTEND=noninteractive  \
  && apt-get upgrade -y -qq \
  && apt-get install -y -qq apt-utils build-essential sudo \
  && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
  && chmod 0440 /etc/sudoers.d/${USERNAME}

{%- if cookiecutter.add_uhd_soapysdr_install_scripts.upper() == "YES" %}
ENV UHD_IMAGES_DIR=/usr/share/uhd/images
{% endif %}

# Install dev dependencies
COPY scripts scripts
RUN apt-get update -qq && export DEBIAN_FRONTEND=noninteractive && apt-get upgrade -y -qq \
  && apt-get install -y -qq git curl wget htop nano python3 zsh bat cmake gdb doxygen graphviz \
  && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
  && cd scripts \
  {% if cookiecutter.add_gcc10_install_script.upper() == "YES" -%}
&& sh install-gcc10.sh \
  {% endif -%}
{%- if cookiecutter.add_armadillo_install_scripts.upper() == "YES" -%}
&& sh install-openblas-lapack.sh && sh install-armadillo.sh \
  {% endif -%}
{%- if cookiecutter.add_arrayfire_install_script.upper() == "YES" -%}
&& sh install-arrayfire.sh \
  {% endif -%}
{%- if cookiecutter.add_matplotpp_install_script.upper() == "YES" -%}
&& sh install-matplotpp.sh \
  {% endif -%}
{%- if cookiecutter.add_catch2_install_script.upper() == "YES" -%}
&& sh install-catch2.sh \
  {% endif -%}
{%- if cookiecutter.add_spdlog_install_script.upper() == "YES" -%}
&& sh install-spdlog.sh \
  {% endif -%}
{%- if cookiecutter.add_json_install_script.upper() == "YES" -%}
&& sh install-json.sh \
  {% endif -%}
{%- if cookiecutter.add_itpp_install_script.upper() == "YES" -%}
&& sh install-itpp.sh \
  {% endif -%}
{%- if cookiecutter.add_pybind11_install_script.upper() == "YES" -%}
&& sh install-pybind11.sh \
  {% endif -%}
{%- if cookiecutter.add_gdal_install_scripts.upper() == "YES" -%}
&& sh install-proj.sh \
  && sh install-gdal.sh \
  {% endif -%}
{%- if cookiecutter.add_geographiclib_install_script.upper() == "YES" -%}
&& sh install-geographiclib.sh \
  {% endif -%}
{%- if cookiecutter.add_uhd_soapysdr_install_scripts.upper() == "YES" -%}
&& sh install-uhd.sh && install-soapysdr.sh && install-soapysdr-uhd-module.sh \
  {% endif -%}
&& cd .. \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf scripts

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