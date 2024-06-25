#!/bin/bash

# Install build tools
python -m pip install setuptools wheel

# Install CycloneDX for SBOM generation
python -m pip install cyclonedx-bom

# https://github.com/CycloneDX/cyclonedx-python
function python_cdx_generate_sbom {
  type=$1
  output=$2

  cyclonedx-py ${type} > ${output}
}

# We are building an upstream package version
# But we cannot silently overwrite it. We will publish
# our patched version to clearly differentiate from upstream
# published artefacts
function get_version_for {
  base_version=$1
  timestamp=$(date +"%Y%m%d%H%M%S")
  patched_version="$base_version-sd-$timestamp"

  echo -n $patched_version
}
