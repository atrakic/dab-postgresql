# dab-postgresql

> Full stack with REST/GraphQL APIs using [Azure Data Api Builder(DAB)](https://aka.ms/dab) and PostgreSQL.

![DAB](https://devblogs.microsoft.com/azure-sql/wp-content/uploads/sites/56/2023/03/dab-architecture-overview.png)


### Docker deployment

```
$ docker-compose up --build --no-deps --remove-orphans -d
```

## Access

- [**Frontend**](http://localhost:3000/) with [Nginx+SSI and VanillaJS](https://nginx.org/en/docs/http/ngx_http_ssi_module.html)
- [**REST API**](http://localhost:5000/api/)
- [**GraphQL**](http://localhost:5000/graphql/)

## LICENSE
See [LICENSE](LICENSE) for details.
