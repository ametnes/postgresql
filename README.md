# Enhanced Bitnami package for PostgreSQL

## Descriptions
Follow [Bitnamic package for PostgreSQL](https://github.com/bitnami/containers/blob/main/bitnami/postgresql/README.md) README.md

## Enhancements
| Enhancement | Description |
|-------------|-------------|
| PGVector Extension | PGVector extension enabled for use as a Vector database |
| PG Cron Extension | PG Cron extension enabled |

## Usage
### PG Vector

1. Run the container
    ```
    docker run -e POSTGRES_PASSWORD=password -p 5432:5432 --rm -it ametnes/postgresql:16-debian-12
    ```
2. In another terminal, connect to the postgres instance
    ```
    psql -h localhost -p 5432 -U postgres postgres
    ```
2. Create the extension
    ```
    CREATE EXTENSION vector;

    ```
3. Create table with vector column
    ```
    CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));
    ```
4. Insert vector embeddings
    ```
    INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
    ```
5. Retrieve vector embeddings
    ```
    SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
    ```

### PG Cron
TO-Do