.DEFAULT_GOAL := help

CONTAINER_PREFIX=covidface
DC=docker-compose -p ${CONTAINER_PREFIX}
DC_BUILD= -f ./infra/Dockerfile
SHELL := /bin/bash

.PHONY: all

setup: pull build up ## Sets up the development environment

pull: ## Pulls the external images
	${DC} pull

build: ## Pulls external images and builds services
	${DC} build --pull

up: ## Builds, (re)creates, starts, and attaches to containers for a service. (containers run in background) 
	${DC} up --detach

down: ## Stops containers and removes containers, networks, and images created by up.
	${DC} down

destroy: ## Destroys the containers, volumes, networks…
	${DC} down -v --remove-orphan

start: ## Starts the containers
	${DC} start

stop: ## Stops the containers
	${DC} stop

restart: ## Restarts the containers
	${MAKE} -B stop start

rebuild: ## Rebuilds the containers
	${MAKE} -B down build up

bash: ARGS = node
bash: ## Enters CLI of running Docker container.
	${DC} exec ${ARGS} bash

.PHONY: logs
logs: ## Shows containers logs
	${DC} logs -f

dc: ARGS = ps
dc: ## Runs docker-compose command. Use ARGS="" to pass parameters to docker-compose.
	${DC} ${ARGS}

### OTHERS
# ¯¯¯¯¯¯¯¯

.PHONY: help
help: ## Displays this help
	@IFS=$$'\n'; for line in `grep -E '^[a-zA-Z_#-]+:?.*?## .*$$' $(MAKEFILE_LIST)`; do if [ "$${line:0:2}" = "##" ]; then \
	echo $$line | awk 'BEGIN {FS = "## "}; {printf "\n\033[33m%s\033[0m\n", $$2}'; else \
	echo $$line | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'; fi; \
	done; unset IFS;
