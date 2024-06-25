# There are no releases in GitHub project. We found the commit SHA
# by manually going through past commits and looking for version number
# in setup.py

PKG_GIT_COMMIT_SHA="2e017b86e2f18a6c8a842293b1687f2ce7baa12e"

# The caller of these functions must set the $PWD
# to directory of the package source code

function build_package {
  pip install -r ./requirements.txt
  python setup.py sdist
}

function get_artifact_path {
  echo -n "dist/Js2Py-0.74.tar.gz"
}
