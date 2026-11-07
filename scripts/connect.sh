#!/usr/bin/env bash
set -euo pipefail

[[ "${SERVICE}" =~ ^[a-z0-9-]+$ ]] || { echo "::error::bad service name: ${SERVICE}"; exit 1; }
engine="$(yq -e ".\"${SERVICE}\".engine" services.yaml)"
database="$(yq -e ".\"${SERVICE}\".database" services.yaml)"

case "${engine}" in
  mariadb)
    echo "::add-mask::${MARIADB_PASSWORD}"
    auth="atlas:${MARIADB_PASSWORD}"
    host="${MARIADB_HOST}:${MARIADB_PORT}"
    live="mysql://${auth}@${host}/${database}"
    scratch="mysql://${auth}@${host}/atlas"
    migrate="mysql://${auth}@tcp(${host})/${database}?multiStatements=true"
    ;;
  postgres)
    echo "::add-mask::${POSTGRES_PASSWORD}"
    auth="atlas:${POSTGRES_PASSWORD}"
    host="${POSTGRES_HOST}:${POSTGRES_PORT}"
    live="postgres://${auth}@${host}/${database}?search_path=public&sslmode=require"
    scratch="postgres://${auth}@${host}/atlas?search_path=public&sslmode=require"
    migrate="postgres://${auth}@${host}/${database}?sslmode=require"
    ;;
  *)
    echo "::error::unknown engine '${engine}' for ${SERVICE}"
    exit 1
    ;;
esac

{
  echo "ENGINE=${engine}"
  echo "DATABASE=${database}"
  echo "LIVE_URL=${live}"
  echo "SCRATCH_URL=${scratch}"
  echo "MIGRATE_URL=${migrate}"
} >> "${GITHUB_ENV}"
