SHELL := /bin/bash

help:
	@./scripts/make/help

cleanup:
	@./scripts/make/cleanup

install:
	@./scripts/make/install

setup-env:
	@bash <(curl -LsS https://raw.githubusercontent.com/typecoercion/dotenv-interactive/v0.0.1/deinit)

setup-mac:
	@bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@brew bundle --no-lock

use-direnv:
	@curl -o .envrc -s https://raw.githubusercontent.com/typecoercion/docker-ops-tools/master/files/.envrc.example
	@direnv allow

use-docker: use-direnv
	@docker-compose build
