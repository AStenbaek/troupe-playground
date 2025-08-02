CONTAINER_NAME=troupe-playground

# master branch
MASTER_IMAGE=troupe-master
MASTER_DOCKERFILE=master.Dockerfile

# dev-integrity branch
DEV_IMAGE=troupe-integrity
DEV_DOCKERFILE=dev-integrity.Dockerfile

TROUPE=/Troupe
WORKSPACE=$(TROUPE)/playground
SRC=$(PWD)/src

# Starting a container
DOCKER_START=docker run -d --rm -it -v $(SRC):$(WORKSPACE) --name $(CONTAINER_NAME)
# Stop docker giving hints
DOCKER_CLI_HINTS=false

MKID_PATH=$(TROUPE)/p2p-tools/built/mkid.mjs
DOCKER_MAKE_ID=docker exec $(CONTAINER_NAME) node $(MKID_PATH)
MKALIAS_PATH=$(TROUPE)/p2p-tools/built/mkaliases.js
DOCKER_MAKE_ALIASES=docker exec $(CONTAINER_NAME) node $(MKALIAS_PATH)

PARSER_ID_PATH=$(WORKSPACE)/arith-server/parse-server.json
EVAL_ID_PATH=$(WORKSPACE)/arith-server/eval-server.json
ALIAS_PATH=$(WORKSPACE)/arith-server/aliases.json

# Build the master branch container
build-master:
	docker build . -f $(MASTER_DOCKERFILE) -t $(MASTER_IMAGE)

# Build the dev-integrity branch container
build-dev:
	docker build . -f $(DEV_DOCKERFILE) -t $(DEV_IMAGE)

# Start docker container with the master branch of Troupe
start-master:
	$(DOCKER_START) $(MASTER_IMAGE)

# Start docker container with the dev-integrity branch of Troupe
start-dev:
	$(DOCKER_START) $(DEV_IMAGE)

# Stop the playground container
stop:
	docker stop $(CONTAINER_NAME)

# Make ids and alias for arith server
arith-p2p:
	$(DOCKER_MAKE_ID) --outfile=$(PARSER_ID_PATH)
	$(DOCKER_MAKE_ID) --outfile=$(EVAL_ID_PATH)
	$(DOCKER_MAKE_ALIASES) --include=$(PARSER_ID_PATH) --include=$(EVAL_ID_PATH) --outfile=$(ALIAS_PATH)

# Remove the arith server json files
arith-clean:
	docker exec $(CONTAINER_NAME) rm -f $(PARSER_ID_PATH) $(EVAL_ID_PATH) $(ALIAS_PATH)
