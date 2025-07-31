#!/bin/bash

# Exit on error
set -e

echo "Installing pymysql..."
pip install pymysql

echo "Starting Langflow..."
python -m langflow run
