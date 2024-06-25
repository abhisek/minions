#!/bin/bash

# Install CycloneDX for SBOM generation
python -m pip install cyclonedx-bom

# https://github.com/CycloneDX/cyclonedx-python
function python_cdx_generate_sbom {
  type=$1
  output=$2

  cyclonedx-py ${type} > ${output}
}
