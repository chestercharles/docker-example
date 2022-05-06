# Docker example repo

## Setup

[Get a NASA API key](https://api.nasa.gov/index.html) and put it in a file called `.env`:

```
// .env

NASA_API_KEY=XXXXXXXXXX
```

## Using Docker

1. Build the docker image

   ```
   docker build --tag nasa_img_app .
   ```

2. Run the docker image

   ```
   docker run -p 3000:3000 --env-file .env nasa_img_app
   ```

## Using Docker Compose

Run docker compose

```
docker compose -f docker-compose.yml up
```
