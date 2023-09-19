## https://azure.github.io/static-web-apps-cli/docs/cli/swa-start
swa:
	swa --version || npm install -g @azure/static-web-apps-cli
	swa start -p 3000 ./app/src --api-devserver-url http://localhost:5000

## https://github.com/Azure/data-api-builder/blob/main/docs/getting-started/getting-started-azure-postgresql.md
dab:
	dab --version || dotnet tool install --global Microsoft.DataApiBuilder
	CONNECTION_STRING="Host=localhost;Database=dab;username=postgres;password=" dab start --no-https-redirect
