#!/bin/bash

ecosystem=$1
name=$2
version=$3

pkg_ecosystem_script = "ecosystems/$ecosystem/build.sh"
pkg_build_script="ecosystems/$ecosystem/$name/build.sh"
pkg_version_build_script="ecosystems/$ecosystem/$name/$version/build.sh"

if [ ! -f $pkg_ecosystem_script ]; then
  echo "Ecosystem build script not found: $pkg_ecosystem_script"
  exit 1
fi

if [ ! -f $pkg_build_script ]; then
  echo "Package build script not found: $pkg_build_script"
  exit 1
fi

if [ ! -f $pkg_version_build_script ]; then
  echo "Package version build script not found: $pkg_version_build_script"
  exit 1
fi

source $pkg_build_script
source $pkg_version_build_script

# Check if variable is defined
if [ -z "$PKG_GIT_URL" ]; then
  echo "PKG_GIT_URL is not defined in build meta"
  exit 1
fi

if [ -z "$PKG_GIT_COMMIT_SHA" ]; then
  echo "PKG_GIT_COMMIT_SHA is not defined in build meta"
  exit 1
fi

exit 0
