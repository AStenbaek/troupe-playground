# Troupe playground
This setup uses a docker container for running Troupe.

## Shell scripts

### `build-image.sh`
This script creates a docker image from the master branch
on the Troupe repository.
The image will be tagged `troupe-master`.

### `start-container.sh`
Will start the docker container and mount the `src` folder,
so the files in `src` are available in the image.
The container is named `troupe-playground`.

### `stop-container.sh`
Will stop the running playground container.
