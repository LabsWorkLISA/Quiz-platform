#!/bin/bash
python manage.py makemigrations --noinput
python manage.py migrate --noinput
python manage.py collectstatic --noinput
python manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL
python manage.py loaddata tests_db_backup.json
python manage.py calculate_analytics 
gunicorn --bind 0.0.0.0:7000 QuizPlatform.wsgi