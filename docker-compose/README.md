# Docker compose setups
This directory contains various Troupe examples
running in an isolated network using docker compose,
illustrating the components in the network, 
without reliance on external nodes for relaying and discovery.

## Dependencies
- Docker
- Docker Compose
- `make` (optional)

### 2025-08-06
At the time of writing, the docker compose examples 
requires the `troupe-integrity` image to have been built separately.
This image is a build of the `dev-integrity` branch in the Troupe repository.
To build the image, can be done by calling `make build-dev` in the root of
this repository.

## Examples
### Echo
This is the echo network example from the Troupe repository.

There are two versions of the example.

The first runs the example in the compose setup with a relay node,
and can be run by calling `make start` in the echo directory
and stopped by `make stop`. 

The second version runs the system without a relay node in the network
and can be start by calling `make start-no-relay` and stopped with
`make stop-no-relay`.
Without a relay the nodes cannot find each other.

### Pingpong
This is the pingpong network example from the Troupe repository,
and can be run by invoking `make start` in the pingpong directory, 
and stopped by invoking `make stop`, also in the pingpong directory.
