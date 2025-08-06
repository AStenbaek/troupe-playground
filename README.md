# Troupe playground
This setup uses a docker container for running Troupe code
from the `src` directory.

The `docker-compose` folder contains examples of running
Troupe nodes in an isolated network using docker compose.

## Makefile and scripts

### `make build-master`
Builds a Troupe container image from the `master` branch.

### `make start-master`
Start the `master` branch Troupe container.

### `make build-dev`
Builds a Troupe container image from the `dev-integrity` branch.

### `make start-dev`
Starts the `dev-integrity` Troupe container.

### `make stop`
Stop the active Troupe container.

### `local.sh`
Run the `local.sh` script in the container on the playground 
file from the `src` folder.
For example, the command `./local.sh odd.trp`,
will run the `odd.trp` file in the container.
