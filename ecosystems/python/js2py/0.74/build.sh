# There are no releases in GitHub project. We found the commit SHA
# by manually going through past commits and looking for version number
# in setup.py

SOURCE=${BASH_SOURCE[0]}
PKG_GIT_COMMIT_SHA="2e017b86e2f18a6c8a842293b1687f2ce7baa12e"

# The caller of these functions must set the $PWD
# to directory of the package source code.

function build_package {
  scriptDir=$(dirname $SOURCE)

  # Apply patches
  patch -p1 < $scriptDir/patches/marven11-CVE-2024-28397-js2py-Sandbox-Escape-patch.txt

  # Make sure dependencies are available
  pip install -r ./requirements.txt

  # Build package
  python setup.py sdist

  # Generate SBOM
  # Function defined at ecosystem level
  python_cdx_generate_sbom "requirements" $(get_sbom_path)
}

function get_artifact_path {
  echo -n "dist/js2py-0.74.tar.gz"
}

function get_sbom_path {
  echo -n "dist/Js2Py-0.74-CycloneDX.sbom"
}
