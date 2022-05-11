# Python Django Quickstart

This is a Python Django Quickstart for [Nullstone](https://nullstone.io).
This is based off the official [Writing your first Django app](https://docs.djangoproject.com/en/4.0/intro/tutorial01/) guide.

This quickstart is set up with:
- Python 3.9
- Django 4

## How to launch via Nullstone

1. Create a public web app. (Remember `app-name` for later)
2. Add a subdomain. (this will add a Load Balancer capability)
3. Provision
  ```shell
  nullstone up --wait --block=<app-name> --env=<env-name>
  ```
4. Build, push, and deploy
  ```shell
  docker build -t django-quickstart .
  nullstone launch --source=django-quickstart --app=<app-name> --env=<env-name>
  ```

## Running locally

You can run this project locally inside Docker or using a dev server.
The docker setup is configured to hot reload; you don't have to rebuild/restart the container when you change code.

### Docker

```shell
docker compose up
```

Visit [http://localhost:5001](http://localhost:5001).

### Dev Server

```shell
poetry run ./manage.py runserver
```

Visit [http://localhost:8000](http://localhost:8000).

## Details about quickstart

1. `poetry init`
2. `poetry add django`
3. `poetry run django-admin startproject app .`
