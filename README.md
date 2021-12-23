# Cookiecutter project for remote development configuration in VSCode

This repository can be used for generating a number of different remote configuration files

In order to start a new project, install [Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/)
and run the following command:

```bash
$ cookiecutter https://intranet.gradiant.org/bitbucket/scm/comg/dockerfiles.git --directory="<dir-name>"
```

It will create the appropriate .devcontainer folder in your project directory. Following, the normal
procedure described in VSCode Remote container documentation.

## C++ Dockerfile and related installation scripts (dir-name: C++)

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

### Variables

Variables allow to customize your project. When running the previous command, you will be prompted
to fill in the following values:

- project_name: Project's name (SHIPMATE, STELARIS, SAURON...)
- project_short_name: Some abbreviation of project's name (useful for include guards)
- full_name: Your full name
- email: Your corpoative email
- install_gcc10_script: flag that controls the inclusion of a gcc10 installation script
- install_matplotpp_script: flag that controls the inclusion of a matplot++ installation script
- install_catch2_script: flag that controls the inclusion of a Catch2 installation script
- install_spdlog_script: flag that controls the inclusion of a spdlog installation script
- install_json_script: flag that controls the inclusion of a JSON for Modern C++ installation script
- install_armadillo_scripts: flag that controls the inclusion of an Armadillo installation script
- install_arrrayfire_script: flag that controls the inclusion of an Arrayfire installation script
- install_itpp_script: flag that controls the inclusion of an IT++ installation script

MORE TBD