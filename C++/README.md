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

This folder's contents shall be copied inside .devcontainer folder in a projects root dir.
