# Use the official Langflow base image
FROM langflowai/langflow:latest

# Switch to root to install system packages
USER root

# Install pymysql system-wide
RUN pip install --no-cache-dir pymysql

# Switch back to the user account
USER user

# Verify installation works
RUN python -c "import pymysql; print('PyMySQL installed successfully')"

# Start Langflow normally
ENTRYPOINT ["python", "-m", "langflow", "run"]
