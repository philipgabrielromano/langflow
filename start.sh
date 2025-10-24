#!/bin/bash
set -e

echo "Installing additional packages..."
pip install --user --no-cache-dir \
    pymysql \
    mysql-connector-python \
    "snowflake-connector-python[pandas]" \
    langchain-pinecone \
    matplotlib \
    seaborn \
    pandas \
    cryptography

echo "Setting Python path..."
export PYTHONPATH="$(python3 -c 'import site; print(site.getusersitepackages())'):$PYTHONPATH"

echo "Starting Langflow..."
exec langflow run --host 0.0.0.0 --port 7860
