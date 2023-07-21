# Qodana for Move

This is an customized qodana-php docker image to include the Move Plugin.

## Changes to original Image

- Added Move plugin
- Added Toml plugin
- Added configs files

## Run it locally

Create `qodana.yaml` file:

```yaml
# qodana.yaml
version: "1.0"
# Following plugin versions are available: 222, 223, 231
linter: ghcr.io/pontem-network/qodana-move:222
```

Run:

```bash
docker run --rm -it -p 8080:8080 -v $(pwd):/data/project ghcr.io/pontem-network/qodana-move:222 --show-report
```

## Use it github actions

You have two options: either save the configuration files directly to the root of the repository, or download them while the action is running

```yaml
name: Qodana
on:
  workflow_dispatch:
  pull_request:
  push:
    branches:
      - main
      - master
jobs:
  qodana:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        version: ["222", "223", "231"]
    
    steps:
      - uses: actions/checkout@v3

      # You can avoid this step if you already have the config files in your repo
      - name: Get configs
        run: |
          wget https://raw.githubusercontent.com/pontem-network/qodana-move/main/config/qodana-inspections-profile.xml
          wget https://raw.githubusercontent.com/pontem-network/qodana-move/main/config/qodana.yaml
          echo "linter: ghcr.io/pontem-network/qodana-move:${{ matrix.version }}" >> qodana.yaml
      
      - name: 'Qodana Scan'
        uses: JetBrains/qodana-action@v2023.2
        env:
          QODANA_TOKEN: ${{ secrets.QODANA_TOKEN }}
```