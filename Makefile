MAKEFLAGS += --silent

APP ?= api

all: up test
	echo ""
	$(MAKE) status
	echo ""
	echo "* Frontend: http://localhost:3000"
	echo "* REST API: http://localhost:5000/api/"
	echo "* GraphSQL: http://localhost:5000/graphql/"
	echo ""

up:
	docker-compose up --remove-orphans -d
	sleep 1

%:
	DOCKER_BUILDKIT=1 docker-compose up --build --force-recreate --no-color $@ -d

psql:
	docker exec -it db psql -h localhost -U postgres -d dab

status:
	docker-compose ps -a

healthcheck:
	docker inspect $(APP) --format "{{ (index (.State.Health.Log) 0).Output }}"

test:
	[ -f ./tests/test.sh ] && ./tests/test.sh
	#echo ""
	#docker exec -it app curl -s http://api:5000/api/Book
	#docker exec -it app curl -s http://api:5000/api/Author
	#echo ""

clean: ## Clean up
	docker-compose down --remove-orphans -v

-include include.mk
