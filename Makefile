MAKEFLAGS += --silent

dab: up
	dab --version || dotnet tool install --global Microsoft.DataApiBuilder
	dab start

swa:
	swa --version || npm install -g @azure/static-web-apps-cli

up:
	docker-compose up -d
	sleep 1

clean: ## Clean up
	docker-compose down --remove-orphans -v

