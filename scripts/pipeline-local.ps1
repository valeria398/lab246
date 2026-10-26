$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force reports | Out-Null
syft dir:. -o cyclonedx-json=reports/sbom-codigo.cdx.json
syft dir:. -o spdx-json=reports/sbom-codigo.spdx.json
docker build -t lab246:1.0.0 .
syft lab246:1.0.0 -o cyclonedx-json=reports/sbom-imagen.cdx.json
syft lab246:1.0.0 -o spdx-json=reports/sbom-imagen.spdx.json
grype sbom:reports/sbom-imagen.cdx.json -o json --file reports/grype-resultados.json
