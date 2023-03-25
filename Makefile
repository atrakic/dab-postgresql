MAKEFLAGS += --silent

## https://github.com/Azure/data-api-builder/blob/main/docs/getting-started/getting-started-azure-postgresql.md
dab: up
	dab --version || dotnet tool install --global Microsoft.DataApiBuilder
	dab start --no-https-redirect

## https://azure.github.io/static-web-apps-cli/docs/cli/swa-start
swa:
	swa --version || npm install -g @azure/static-web-apps-cli
	swa start ./client/src --api-devserver-url http://localhost:5000

up:
	docker-compose up -d
	sleep 1

test:
	[ -f ./tests/test.sh ] && ./tests/test.sh

clean: ## Clean up
	docker-compose down --remove-orphans -v

-include include.mk
