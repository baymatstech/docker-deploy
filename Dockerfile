FROM python:3.11-alpine

ENV DJANGO_SETTINGS_MODULE=docker_deploy.settings
ENV DEBUG=False
ENV ALLOWED_HOSTS=localhost

WORKDIR /usr/src/app

RUN pip install poetry

# Install dependencies
COPY pyproject.toml poetry.lock /usr/src/app/

RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi --no-root

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 8000

# CMD ["gunicorn", "--workers=3", "--bind=0.0.0.0:8000", "docker_deploy.wsgi:application"]
