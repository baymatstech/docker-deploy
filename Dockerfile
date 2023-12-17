FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=docker_deploy.settings
ENV DEBUG=False
ENV ALLOWED_HOSTS=localhost

WORKDIR /usr/src/app

# Install dependencies
# We use --no-cache-dir to keep the docker image as small as possible
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "--workers=3", "--bind=0.0.0.0:8000", "docker_deploy.wsgi:application"]
