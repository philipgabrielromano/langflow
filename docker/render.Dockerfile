# Use the official Langflow base image
FROM langflowai/langflow:latest

# Install pymysql system-wide inside the container
RUN pip install pymysql

# Start Langflow normally
ENTRYPOINT ["python", "-m", "langflow", "run"]
