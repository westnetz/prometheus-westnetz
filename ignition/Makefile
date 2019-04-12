.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[\.a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build all Docker images
	docker-compose build

CT ?= docker-compose run --rm ct
.PHONY: config
config: ## Transpiles Cloud Linux YML to Ignition JSON
	$(CT) \
		-files-dir /host \
		-pretty \
		-strict \
		< config.yml \
		> config.json

.PHONY: clean
clean: ## Cleans up files which are build artefacts
	rm -f config.json
