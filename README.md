# Cookiecutter project for remote development configuration in VSCode

This repository can be used for generating a number of different VSCode remote container
configuration files.

## Usage

In order to start a new project, install [Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/) and run the following command:

```bash
$ cookiecutter https://intranet.gradiant.org/bitbucket/scm/comg/com-docker-devenvs.git --directory="<dir-name>"
```

Where 'dir-name' is one of the sub-folders of this repository (each one will hold a different configuration for remote development in Docker containers).

It will create the appropriate .devcontainer folder in your project directory (wherever you invoke
cookiecutter). Following, the normal procedure described in VSCode Remote container documentation
can be used to setup the remote environment up and running.

NOTE: it can also be cloned using GIT over SSH, if properly configured in your account.

NOTE1: after the repository is downloaded, the template can be used again without downloading it
again. In order to do so, simply specify template name as argument for cookiecutter:

```bash
$ cookiecutter com-docker-devenvs --directory="<dir-name>"
```

### C++ Dockerfile and related installation scripts (dir-name: cpp-dockerfile)

This template is intended to be used in VSCode remote container development for C++. It builds a new
image based on the contents of the provided dockerfile.

It optionally installs gcc/g++ v10 and some useful utilities, namely:

- Libraries:
    - IT++: http://itpp.sourceforge.net/4.3.1/index.html
    - Arrayfire: https://arrayfire.com/
    - Armadillo: https://arma.sourceforge.net/docs.html
    - JSON For Modern C++: https://github.com/nlohmann/json
    - Geographiclib: https://geographiclib.sourceforge.io/
    - PROJ: https://proj.org/
    - GDAL: https://github.com/OSGeo/gdal
    - LDPC SIMD: https://sdrmaker.space/activity/ & https://gitlab.com/librespacefoundation/sdrmakerspace/ldpc_simd
    - PyBind11: https://github.com/pybind/pybind11

- Testing deps:
    - Catch2: https://github.com/catchorg/Catch2
    - Matplot++: https://alandefreitas.github.io/matplotplusplus/
        - Inside Docker, the non-interactive must be used in order to avoid the invocation of a graphics
          backend. Refs:
            - https://alandefreitas.github.io/matplotplusplus/coding-styles/reactive-vs-quiet-figures/
            - https://alandefreitas.github.io/matplotplusplus/exporting/saving-programatically/

#### Variables

Variables allow to customize your project. After running one of the previous cookiecutter commands,
you will be prompted to fill in the following values:

- **project_name**: Project's name (SHIPMATE, STELARIS, SAURON...)
- **project_short_name**: Some abbreviation of project's name (useful for include guards: SMT, SIOT, SRN...)
- **full_name**: Your full name
- **email**: Your corporative email
- **add_gcc10_install_script**: flag that controls the inclusion of a gcc10 installation script
- **add_matplotpp_install_script**: flag that controls the inclusion of a matplot++ installation script
- **add_catch2_install_script**: flag that controls the inclusion of a Catch2 installation script
- **add_spdlog_install_script**: flag that controls the inclusion of a spdlog installation script
- **add_json_install_script**: flag that controls the inclusion of a JSON for Modern C++ installation script
- **add_armadillo_install_scripts**: flag that controls the inclusion of an Armadillo installation script
- **add_arrayfire_install_script**: flag that controls the inclusion of an Arrayfire installation script
- **add_itpp_install_script**: flag that controls the inclusion of an IT++ installation script
- **add_geographiclib_install_script**: flag that controls the inclusion of an geographiclib installation script
- **add_pybind11_install_script**: flag that controls the inclusion of an pybind11 installation script
- **add_gdal_install_scripts**: flag that controls the inclusion of PROJ && GDAL installation scripts
- **add_uhd_soapysdr_install_scripts**: flag that controls the inclusion of UHD && soapySDR installation scripts

### C++ Dockerfile based on custom GRD Image (dir-name: cpp-image)

This template is intended to be used in VSCode remote container development for C++. It builds a new
image based on a previously built one which is stored in [Harbor](https://harbor.gradiant.org/com).

**NOTE THAT** cpp-devimage and cpp-devimage-soapy may have different tag versions. Please check in Harbor 
before specifying image version in template!!

It has many dependencies already installed and configured, namely:

- Libraries:
    - IT++: http://itpp.sourceforge.net/4.3.1/index.html
    - Arrayfire: https://arrayfire.com/
    - Armadillo: https://arma.sourceforge.net/docs.html
    - JSON For Modern C++: https://github.com/nlohmann/json
    - UHD
    - SoapySDR

- Testing deps:
    - Catch2: https://github.com/catchorg/Catch2
    - Matplot++: https://alandefreitas.github.io/matplotplusplus/
        - Inside Docker, the non-interactive must be used in order to avoid the invocation of a graphics
          backend. Refs:
            - https://alandefreitas.github.io/matplotplusplus/coding-styles/reactive-vs-quiet-figures/
            - https://alandefreitas.github.io/matplotplusplus/exporting/saving-programatically/

Note that versions of those libraries may vary between image versions. In order to check them, use
the following command after obtaining the image:

```bash
docker image inspect --format='{{json .Config.Labels}}' <image-name>
```

OR (with [jq](https://stedolan.github.io/jq/) utility installed via apt-get)

```bash
docker image inspect --format='{{json .Config.Labels}}' <image-name> | jq
```

It shall produce a output similar (containing) to the following:

```json
{
  "com.visualstudio.code.devcontainers.id": "cpp",
  "com.visualstudio.code.devcontainers.release": "v0.190.0",
  "com.visualstudio.code.devcontainers.source": "https://github.com/microsoft/vscode-dev-containers/",
  "com.visualstudio.code.devcontainers.timestamp": "Wed, 28 Jul 2021 22:25:03 GMT",
  "com.visualstudio.code.devcontainers.variant": "focal",
  "copyright": "Centro Tecnol??xico de Telecomunicaci??ns de Galicia (GRADIANT)",
  "grd.com.dev.dep.version.armadillo": "10.5.2",
  "grd.com.dev.dep.version.arrayfire": "3.7.3",
  "grd.com.dev.dep.version.catch2": "3.0.0-preview3",
  "grd.com.dev.dep.version.g++": "10",
  "grd.com.dev.dep.version.itpp": "4.3.1",
  "grd.com.dev.dep.version.json4moderncpp": "3.9.1",
  "grd.com.dev.dep.version.lapack": "apt-get",
  "grd.com.dev.dep.version.matplotpp": "1.1.0",
  "grd.com.dev.dep.version.openblas": "apt-get",
  "grd.com.dev.dep.version.spdlog": "1.8.5",
  "grd.com.maintainer.mail": "aferreiro@gradiant.org",
  "grd.com.maintainer.name": "Andr??s Ferreiro Gonz??lez",
  "grd.com.version": "v0.2.0",
  "version": "0.201.8"
}
```

#### Variables

Variables allow to customize your project. After running one of the previous cookiecutter commands,
you will be prompted to fill in the following values:

- **project_name**: Project's name (SHIPMATE, STELARIS, SAURON...)
- **project_short_name**: Some abbreviation of project's name (useful for include guards: SMT, SIOT, SRN...)
- **full_name**: Your full name
- **email**: Your corporative email
- **dev_image_version**: Version of the image to be used for container generation. IMPORTANT! Leave
  it with the default value unless necessary (you know what you are doing).
- **add_uhd_soapysdr_install_scripts**: flag that controls the inclusion of UHD && soapySDR installation scripts

NOTE: In order to use this image, access to Gradiant's Harbor repository for COM has to be obtained,
and successful login performed from Docker CLI.

### More docker images and configs TBD

## Contributing

If you want to contribute to this template, feel free to do so! Create a new branch to work in, and
open a pull request when you are done! It will be reviewed and merged into master by one of the
maintainers as soon as possible.
