#!/bin/sh
set -e

until pg_isready -h db -p 5432 -U "$DB_USER"; do
  echo "Waiting for database..."
  sleep 2
done

alembic upgrade head || echo "Migration failed, continuing..."

exec "$@"