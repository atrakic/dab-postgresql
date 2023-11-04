MAKEFLAGS += --silent

APP ?= api

all: up test

up:
	docker-compose up --build --force-recreate --remove-orphans -d
	sleep 1

status:
	docker-compose ps -a

healthcheck:
	docker inspect $(APP) --format "{{ (index (.State.Health.Log) 0).Output }}"

test:
	[ -f ./tests/test.sh ] && ./tests/test.sh
	docker exec -it app curl -s http://api:5000/api/Book
	docker exec -it app curl -s http://api:5000/api/Author

clean: ## Clean up
	docker-compose down --remove-orphans -v

-include include.mk
