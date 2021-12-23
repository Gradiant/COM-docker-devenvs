'''
post_gen_project.py

Post-generate hook for cookiecutter.

Maintainer Andrés Ferreiro González (andres.ferreiro.glez@gmail.com)

Created @ Thursday, 23rd December 2021 2:31:56 pm
Copyright (c) 2021 Andrés Ferreiro González
All Rights Reserved
'''

from pathlib import Path
import logging


def rename_to_devcontainer():
    """Renames base folder to .devcontainer after project generation."""
    LOG.info("Renaming proj folder to .devcontainer...")
    path = Path("{}".format({{cookiecutter.project_short_name}}))
    path.rename(".devcontainer")


if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG, format="%(message)s")
    LOG = logging.getLogger("post_gen_project")
    rename_to_devcontainer()