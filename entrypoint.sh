#!/bin/sh

echo "Running migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic

echo "Starting server..."
python manage.py runserver 0.0.0:8000

echo "Server started."


