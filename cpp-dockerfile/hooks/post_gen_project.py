"""Post-generate hook for cookiecutter."""

import logging
from pathlib import Path


def change_line_endings_crlf_to_lf():
    for path in Path(".").glob("**/*"):
        if path.is_file():
            data = path.read_bytes()
            lf_data = data.replace(b"\r\n", b"\n")
            path.write_bytes(lf_data)


def remove_unused_script_files():

    if "{{ cookiecutter.add_gcc10_install_script.upper() }}" == "NO":
        LOG.info("Skipping gcc10 installation script file generation ...")
        path = Path("./scripts/install-gcc10.sh")
        path.unlink()
    if "{{ cookiecutter.add_matplotpp_install_script.upper() }}" == "NO":
        LOG.info("Skipping matplotpp installation script file generation ...")
        path = Path("./scripts/install-matplotpp.sh")
        path.unlink()
    if "{{ cookiecutter.add_catch2_install_script.upper() }}" == "NO":
        LOG.info("Skipping catch2 installation script file generation ...")
        path = Path("./scripts/install-catch2.sh")
        path.unlink()
    if "{{ cookiecutter.add_spdlog_install_script.upper() }}" == "NO":
        LOG.info("Skipping spdlog installation script file generation ...")
        path = Path("./scripts/install-spdlog.sh")
        path.unlink()
    if "{{ cookiecutter.add_json_install_script.upper() }}" == "NO":
        LOG.info("Skipping json installation script file generation ...")
        path = Path("./scripts/install-json.sh")
        path.unlink()
    if "{{ cookiecutter.add_armadillo_install_scripts.upper() }}" == "NO":
        LOG.info("Skipping armadillo installation script files generation ...")
        path = Path("./scripts/install-openblas-lapack.sh")
        path.unlink()
        path = Path("./scripts/install-armadillo.sh")
        path.unlink()
    if "{{ cookiecutter.add_arrayfire_install_script.upper() }}" == "NO":
        LOG.info("Skipping arrayfire installation script file generation ...")
        path = Path("./scripts/install-arrayfire.sh")
        path.unlink()
    if "{{ cookiecutter.add_itpp_install_script.upper() }}" == "NO":
        LOG.info("Skipping itpp installation script file generation ...")
        path = Path("./scripts/install-itpp.sh")
        path.unlink()
    if "{{ cookiecutter.add_geographiclib_install_script.upper() }}" == "NO":
        LOG.info("Skipping geographiclib installation script file generation ...")
        path = Path("./scripts/install-geographiclib.sh")
        path.unlink()
    if "{{ cookiecutter.add_pybind11_install_script.upper() }}" == "NO":
        LOG.info("Skipping pybind11 installation script file generation ...")
        path = Path("./scripts/install-pybind11.sh")
        path.unlink()
    if "{{ cookiecutter.add_gdal_install_scripts.upper() }}" == "NO":
        LOG.info("Skipping gdal installation script files generation ...")
        path = Path("./scripts/install-proj.sh")
        path.unlink()
        path = Path("./scripts/install-gdal.sh")
        path.unlink()
    if "{{ cookiecutter.add_ldpc_simd_install_script.upper() }}" == "NO":
        LOG.info("Skipping ldpc_simd installation script file generation ...")
        path = Path("./scripts/install-ldpc_simd.sh")
        path.unlink()

if __name__ == "__main__":

    logging.basicConfig(level=logging.DEBUG, format="%(message)s")
    LOG = logging.getLogger("post_gen_project")
    remove_unused_script_files()
    change_line_endings_crlf_to_lf()