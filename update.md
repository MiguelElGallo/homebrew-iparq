Refresh the formula from the published iParq source distribution and the dependency lock inside it. The updater uses uv and Python 3.14.

```sh
./update-resources.sh 0.9.0
git diff -- Formula/iparq.rb
```

Omit the version to use the latest release on PyPI. The script verifies the source archive, selects the locked `vortex` extra, and updates the formula and its source and wheel checksums together.
