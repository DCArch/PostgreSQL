#!/bin/bash

# Install DCSim extension into PostgreSQL template1 database
# This allows all new databases to automatically inherit the extension
# Run this once after building PostgreSQL with DCSim

set -e

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# PostgreSQL paths
POSTGRES_BIN="${POSTGRES_BIN:-${SCRIPT_DIR}/Release/bin}"
POSTGRES_LIB="${POSTGRES_LIB:-${SCRIPT_DIR}/Release/lib}"

# Database connection settings
DB_HOST="${DB_HOST:-localhost}"
DB_PORT="${DB_PORT:-5432}"

echo "Installing DCSim extension to template1..."
echo "PostgreSQL bin: ${POSTGRES_BIN}"
echo "PostgreSQL lib: ${POSTGRES_LIB}"
echo ""

# Set library path
export LD_LIBRARY_PATH="${POSTGRES_LIB}"

# Install extension in template1
"${POSTGRES_BIN}/psql" -h ${DB_HOST} -p ${DB_PORT} -d template1 <<EOF
CREATE EXTENSION IF NOT EXISTS dcsim;
EOF

echo ""
echo "DCSim extension installed successfully!"
echo "All new databases will now inherit the dcsim extension."
