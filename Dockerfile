FROM python:3.13.3-slim-bookworm

ENV PYTHONUNBUFFERED=1, PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl libpq-dev

COPY src/requirements.txt .

RUN pip install -r requirements.txt

COPY ./src/ .

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["gunicorn", "django_docker_demo.wsgi:application", "--bind", "0.0.0.0:8000"]

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]  
