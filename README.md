# Cookiecutter project for remote development configuration in VSCode

This repository can be used for generating a number of different VSCode remote container
configuration files.

## Usage

In order to start a new project, install [Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/) and run the following command:

```bash
$ cookiecutter https://intranet.gradiant.org/bitbucket/scm/comg/dockerfiles.git --directory="<dir-name>"
```

Donde <dir-name> es uno de los sub-directorios de este repositorio (cada uno contendrá una configuración 
diferente para desarrollo en contenedores Docker).

It will create the appropriate .devcontainer folder in your project directory (wherever you invoke
cookiecutter). Following, the normal procedure described in VSCode Remote container documentation
can be used to setup the remote environment up and running.

NOTE: it can also be cloned using GIT over SSH, if properly configured in your account.

NOTE1: after the repository is downloaded, the template can be used again without downloading it
again. In order to do so, simply specify template name as argument for cookiecutter:

```bash
$ cookiecutter dockerfiles --directory="<dir-name>"
```

### C++ Dockerfile and related installation scripts (dir-name: C++)

This dockerfile is intended to be used in VSCode remote container development for C++.

It optionally installs gcc/g++ v10 and some useful utilities, namely:

- Libraries:
    - IT++: http://itpp.sourceforge.net/4.3.1/index.html
    - Arrayfire: https://arrayfire.com/
    - Armadillo: https://arma.sourceforge.net/docs.html
    - JSON For Modern C++: https://github.com/nlohmann/json

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
- **project_short_name**: Some abbreviation of project's name (useful for include guards)
- **full_name**: Your full name
- **email**: Your corpoative email
- **install_gcc10_script**: flag that controls the inclusion of a gcc10 installation script
- **install_matplotpp_script**: flag that controls the inclusion of a matplot++ installation script
- **install_catch2_script**: flag that controls the inclusion of a Catch2 installation script
- **install_spdlog_script**: flag that controls the inclusion of a spdlog installation script
- **install_json_script**: flag that controls the inclusion of a JSON for Modern C++ installation script
- **install_armadillo_scripts**: flag that controls the inclusion of an Armadillo installation script
- **install_arrrayfire_script**: flag that controls the inclusion of an Arrayfire installation script
- **install_itpp_script**: flag that controls the inclusion of an IT++ installation script

### More docker images and configs TBD

## Contributing

If you want to contribute to this template, feel free to do so! Create a new branch to work in, and
open a pull request when you are done! It will be reviewed and merged into master by one of the
maintainers as soon as possible.