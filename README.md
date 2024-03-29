# Enhanced Bitnami package for PostgreSQL

## Description
Follow [Bitnami package for PostgreSQL](https://github.com/bitnami/containers/blob/main/bitnami/postgresql/README.md) README.md

<p align="center">
  <a href="https://cloud.ametnes.com/console/signin?callback_id=xiex7aiYo5wa8ooshavae6ik5ShoopieS4So7Aixaejieph6noothaj7nahquageza9wahtaSoo2vaingaed9gu9OoPhee6thi2iu4ThieZohci1waiyohn8eiVat4zah4aiy9saiy5suteiquasah" rel="Try in Ametnes" _target="blank">
      <img src="https://cloud.ametnes.com/api/assets/trywithametnes" width="150" />
  </a>
</p>

## Enhancements
| Enhancement | Description |
|-------------|-------------|
| pgvector Extension | Vector DB extension enabled for use as a Vector embeddings storage |
| pg_cron Extension | Extension enabled for in database scheduled tasks |

## Usage

1. Run the container
    ```
    docker run -e POSTGRES_PASSWORD=password -p 5432:5432 --rm -it ametnes/postgresql:16-debian-12
    ```
2. In another terminal, connect to the postgres instance
    ```
    psql -h localhost -p 5432 -U postgres postgres
    ```
    
### pgvector

1. Create the extension
    ```
    CREATE EXTENSION vector;

    ```
2. Create table with vector column
    ```
    CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));
    ```
3. Insert vector embeddings
    ```
    INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
    ```
4. Retrieve vector embeddings
    ```
    SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
    ```

### pg_cron
TO-Do
