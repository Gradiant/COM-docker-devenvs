# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.183.0/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version: debian-10, debian-9, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

WORKDIR /home/vscode

COPY scripts scripts

# avoid warnings by switching to noninteractive
RUN export DEBIAN_FRONTEND=noninteractive && sudo apt-get update -qq && sudo apt-get upgrade -y -qq \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /home/vscode/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions

COPY conf/.zshrc /home/vscode
COPY conf/custom.zsh-theme /home/vscode/.oh-my-zsh/custom/themes

COPY conf/.zshrc /root
COPY conf/custom.zsh-theme /root/.oh-my-zsh/custom/themes

{% if cookiecutter.add_gcc10_install_script.upper() == "YES" -%}
RUN sh scripts/install-gcc10.sh
{% endif -%}

{%- if cookiecutter.add_matplotpp_install_script.upper() == "YES" -%}
RUN sh scripts/install-matplotpp.sh
{% endif -%}

{%- if cookiecutter.add_catch2_install_script.upper() == "YES" -%}
RUN sh scripts/install-catch2.sh
{% endif -%}

{%- if cookiecutter.add_spdlog_install_script.upper() == "YES" -%}
RUN sh scripts/install-spdlog.sh
{% endif -%}

{%- if cookiecutter.add_json_install_script.upper() == "YES" -%}
RUN sh scripts/install-json.sh
{% endif -%}

{%- if cookiecutter.add_armadillo_install_scripts.upper() == "YES" -%}
RUN sh scripts/install-openblas-lapack.sh \
  && sh scripts/install-armadillo.sh
{% endif -%}

{%- if cookiecutter.add_arrayfire_install_script.upper() == "YES" -%}
RUN sh scripts/install-arrayfire.sh
{% endif -%}

{%- if cookiecutter.add_itpp_install_script.upper() == "YES" -%}
RUN sh scripts/install-itpp.sh
{% endif -%}

{%- if cookiecutter.add_geographiclib_install_script.upper() == "YES" -%}
RUN sh scripts/install-geographiclib.sh
{% endif -%}

{%- if cookiecutter.add_pybind11_install_script.upper() == "YES" -%}
RUN sh scripts/install-pybind11.sh
{% endif -%}

{%- if cookiecutter.add_gdal_install_scripts.upper() == "YES" -%}
RUN sh scripts/install-proj.sh \
  && sh scripts/install-gdal.sh
{% endif -%}

{%- if cookiecutter.add_ldpc_simd_install_script.upper() == "YES" -%}
RUN sh scripts/install-ldpc_simd.sh
{% endif -%}


# Set the default shell to bash rather than sh
ENV SHELL /bin/zsh