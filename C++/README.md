# C++ Dockerfile and related installation scripts

This dockerfile is intended to be used in VSCode remote container development for C++.

It installs gcc/g++ v10 and some useful utilities, namely:

- Libraries:
    - IT++: http://itpp.sourceforge.net/4.3.1/index.html
    - Arrayfire: https://arrayfire.com/
    - Armadillo: https://arma.sourceforge.net/docs.html

- Testing deps:
    - Catch2: https://github.com/catchorg/Catch2
    - Matplot++: https://alandefreitas.github.io/matplotplusplus/
        - Inside Docker, the non-interactive must be used in order to avoid the invocation of a graphics
          backend. Refs:
            - https://alandefreitas.github.io/matplotplusplus/coding-styles/reactive-vs-quiet-figures/
            - https://alandefreitas.github.io/matplotplusplus/exporting/saving-programatically/

.devcontainer folder with all its contents shall be copied inside root dir of target project.

## IMPORTANT!! The following fields must be updated in devcontainer.json before container build

- Line 20: PSI-Header extension author name (Defaults to "<Author name>").

- Line 23: PSI-Header extension author email (Defaults to "<author email>").

- Line 53: PSI-Header extension project name (Defaults to "project-name").

- Line 135: VSCode mount point source name for bash command history (Defaults to project-name-bashhistory)