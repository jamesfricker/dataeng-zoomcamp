# Data Engineering Zoomcamp

This work is relevant for the 2023 cohort starting in Jan '23.

## Homework

Q1 and Q2 are quite easy, we can see these by running `make q1` and `make q2`.

For Q3 and beyond, we need to setup docker compose and postgres.

### Q3+

My preparation for postgress questions

1. Build local image `docker build -t taxi_ingest:v001 -f Dockerfile .`
2. build docker-compose `docker-compose up`
3. visit http://localhost:8080/ and log in with `pgadmin` details
4. add connection, with `pgdatabase` details
5. add initial data with command below

```
docker run -it  \
    --network=week-1_default \
    taxi_ingest:v001 \
      --user=root \
      --password=root \
      --host=pgdatabase \
      --port=5432 \
      --db=ny_taxi \
      --table_name=yellow_taxi_data \
      --url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-01.csv.gz" \
```

Next, build the image again, without the datetime stuff.

Do this by commenting out these lines
```
    # df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
    # df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
```

and rebuild the image with a new tag
`docker build -t taxi_ingest:v002 -f Dockerfile .`

Load the Zone Data

```
docker run -it  \
    --network=week-1_default \
    taxi_ingest:v002 \
      --user=root \
      --password=root \
      --host=pgdatabase \
      --port=5432 \
      --db=ny_taxi \
      --table_name=yellow_taxi_zone_data \
      --url="https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv"
```

Now, go back to the pgadmin console and confirm that the data has arrived.

Select TOOLS > QUERY TOOL, and start your SQL queries.

Tables are `yellow_taxi_data` and `yellow_taxi_zone_data`.

Solution SQL is next to my answers in the `homework.md` file.
