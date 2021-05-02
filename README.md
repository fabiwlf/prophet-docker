# 📈 Facebook Prophet with Docker
Dockerfile for [facebook/prophet](https://github.com/facebook/prophet), leveraging multi stage builds

### Usage

#### Using Image from GitHub packages
```sh
docker pull ghcr.io/fabiwlf/prophet-docker:latest
```

#### Running example
```sh
# This will start a container and mount the "example" folder to it
docker run -it --rm -v $(pwd)/example:/app prophet-docker
```

#### Building Image from source
```sh
docker build -f Dockerfile -t prophet-docker . # from Dockerfile
```

#### Troubleshooting
```sh
# Building Image on ARM64 / other platforms (e.g. Apple M1 Macs)
docker buildx build --platform linux/amd64 --load -t prophet-docker .
```
