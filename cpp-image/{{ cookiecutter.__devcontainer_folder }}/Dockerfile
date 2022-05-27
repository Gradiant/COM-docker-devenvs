{% if cookiecutter.add_uhd_soapysdr_install_scripts.upper() == "YES" -%}
FROM harbor.gradiant.org/com/com-cpp-devimage-soapy:{{ cookiecutter.dev_image_version }}
{% else -%}
FROM harbor.gradiant.org/com/com-cpp-devimage:{{ cookiecutter.dev_image_version }}
{% endif -%}
# Set the default shell to bash rather than sh
ENV SHELL /bin/zsh