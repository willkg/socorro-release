DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "Available rules:"
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed 's/\(.*\):.*##/\1:  /'

.PHONY: lint
lint:  ## Lint and reformat Python files
	tox -e py38-lint

.PHONY: test
test:  ## Run tests
	tox
