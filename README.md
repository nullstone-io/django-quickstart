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

Visit [http://localhost:9000](http://localhost:9000).

### Dev Server

```shell
poetry run ./manage.py runserver
```

Visit [http://localhost:8000](http://localhost:8000).

## Details about quickstart

1. Install django using `pip install django`.
2. Run `django-admin startproject app .`
3. Add dependencies to `requirements.txt`.
  ```python
  asgiref ~= 3.5.1
  django ~= 4.0.4
  sqlparse ~= 0.4.2
  tzdata ~= 2022.1
  ```
4. Configure `settings.py` with `DJANGO_DEBUG`
  ```python
  # DEBUG = True
  DEBUG = os.environ.get('DJANGO_DEBUG', '') != 'False'
  ```
5. Configure `settings.py` with `SECRET_KEY`
  ```python
  SECRET_KEY = os.environ.get('SECRET_KEY', default='default-key')
  ```
6. Add `ALLOWED_HOSTS` from Nullstone.
  ```python
  NULLSTONE_PUBLIC_HOSTS = os.environ.get('NULLSTONE_PUBLIC_HOSTS')
  if NULLSTONE_PUBLIC_HOSTS:
    ALLOWED_HOSTS.append(NULLSTONE_PUBLIC_HOSTS)
  NULLSTONE_PRIVATE_HOSTS = os.environ.get('NULLSTONE_PRIVATE_HOSTS')
  if NULLSTONE_PRIVATE_HOSTS:
    ALLOWED_HOSTS.append(NULLSTONE_PRIVATE_HOSTS)
  ```
7. Add private IP address into `ALLOWED_HOSTS`.
  ```python
  ECS_PRIVATE_IPS = os.environ.get('ECS_PRIVATE_IPS')
  if ECS_PRIVATE_IPS:
    ALLOWED_HOSTS.append(ECS_PRIVATE_IPS)
  ```

