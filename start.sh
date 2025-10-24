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

echo "Setting correct Python path..."
export PYTHONPATH="/app/data/.local/lib/python3.12/site-packages:${PYTHONPATH}"

echo "Testing imports..."
python3 -c "import matplotlib; import pymysql; print('All packages imported successfully')"

echo "Starting Langflow..."
exec langflow run --host 0.0.0.0 --port 7860
