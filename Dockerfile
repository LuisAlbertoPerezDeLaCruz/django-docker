FROM python:3.13.3-slim-bookworm

ENV PYTHONUNBUFFERED=1, PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl libpq-dev

COPY src/requirements.txt .

RUN pip install -r requirements.txt

COPY ./src/ .

EXPOSE 8000

CMD [ "./entrypoint.sh" ]


