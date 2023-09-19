MAKEFLAGS += --silent

all: up test

up:
	docker-compose up --force-recreate --remove-orphans -d #--pull always -d
	sleep 1

test:
	[ -f ./tests/test.sh ] && ./tests/test.sh

clean: ## Clean up
	docker-compose down --remove-orphans -v

-include include.mk
