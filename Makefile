MAKEFLAGS += --silent

all: up test
	docker-compose ps -a

up:
	docker-compose up --build --force-recreate --remove-orphans -d
	sleep 1

status:
	docker-compose ps -a

test:
	[ -f ./tests/test.sh ] && ./tests/test.sh
	docker exec -it app curl -s http://dab:5000/api/Book
	docker exec -it app curl -s http://dab:5000/api/Author

clean: ## Clean up
	docker-compose down --remove-orphans -v

-include include.mk
