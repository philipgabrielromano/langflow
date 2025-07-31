FROM langflowai/langflow:latest

# Install to user site-packages (it's already installed, but for clean builds)
RUN pip install --user pymysql

# Set the correct PYTHONPATH to include the user site-packages location
ENV PYTHONPATH=/app/data/.local/lib/python3.12/site-packages:$PYTHONPATH

# Verify it works (optional - you can remove this after testing)
RUN python -c "import pymysql; print('PyMySQL version:', pymysql.__version__)"

ENTRYPOINT ["python", "-m", "langflow", "run"]
