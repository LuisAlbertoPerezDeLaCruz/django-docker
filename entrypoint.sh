#!/bin/sh
python manage.py migrate
python manage.py collectstatic --noinput
exec "$@"

## cho "Starting server..."
# python manage.py runserver 0.0.0:8000
## echo "Server started."


