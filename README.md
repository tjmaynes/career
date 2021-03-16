# Career

> CV/Resume.

## Requirements

- [XeLaTeX](https://www.overleaf.com/learn/latex/XeLaTeX)

## Usage

To compile LaTeX files, run the following command:
```bash
make build
```

To ship the latest artifacts, run the following command:
```bash
make ship_it
```

To build the =docker= image, run the following command:
```bash
TAG=<some-build-tag> \
make build_image
```

To push the =docker= image to dockerhub, run the following command:
```bash
REGISTRY_PASSWORD=<some-registry-password> \
TAG=<some-build-tag> \
make push_image
```
