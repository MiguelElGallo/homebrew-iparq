# Homebrew tap for iParq

Install [iParq](https://iparq.dev/), the Parquet and Vortex metadata inspection CLI, with:

```sh
brew install miguelelgallo/iparq/iparq
```

The formula includes the native Vortex reader for Apple silicon and Intel Macs, and for arm64 and x86-64 Linux. Inspect both formats with the same command.

```sh
iparq inspect events.vortex events.parquet --format json
```

The formula tracks the release published on [PyPI](https://pypi.org/project/iparq/).
Source code and release notes are in the [main repository](https://github.com/MiguelElGallo/iparq).
