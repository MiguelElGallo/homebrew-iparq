Get the current iParq source distribution URL and checksum from PyPI:

```sh
curl -fsSL https://pypi.org/pypi/iparq/json \
  | jq '.urls[] | select(.packagetype == "sdist") | {url, sha256: .digests.sha256}'
```
