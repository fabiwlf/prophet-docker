# Dockerfile for Facebook Prophet
Dockerfile for [facebook/prophet](https://github.com/facebook/prophet), leveraging multi stage builds

### Usage

#### Building Image from source
```sh
docker build https://github.com/fabiwlf/prophet-docker # from git
docker build -f Dockerfile -t prophet-docker . # from Dockerfile
```

#### Running example
```sh
# This will start a container and mount the "example" folder to it
docker run -it --rm -v $(pwd)/example:/app prophet-docker
```


#### Troubleshooting
```sh
# Building Image on ARM64 / other platforms (e.g. Apple M1 Macs)
docker buildx build --platform linux/amd64 --load -t prophet-docker .
```
