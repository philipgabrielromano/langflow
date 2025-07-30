FROM langflowai/langflow:latest

# Install pymysql (and any other needed packages)
RUN pip install pymysql

ENTRYPOINT ["python", "-m", "langflow", "run"]
