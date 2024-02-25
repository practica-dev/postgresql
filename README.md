# postgresql

## Dockerfile

```Dockerfile
FROM postgres:16.1
COPY *.sql /docker-entrypoint-initdb.d/
```

## Crear imagen de contenedor

```bash
$docker build -t app/postgres:0.0.1 .
```

## Ejecutar contenedor Docker

```bash
$docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=app -e POSTGRES_USER=app -e POSTGRES_DB=app -d app/postgres:0.0.1
```

## Ingresar al contenedor

```bash
$docker exec -it postgres bash

$psql -d app -U app
```

## listar las tablas de la bases de datos

```sql
# \dt
```

## describe la tabla

```sql
# \d+ tablename
```
