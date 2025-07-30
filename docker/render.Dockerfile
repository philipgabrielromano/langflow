FROM langflowai/langflow:latest

# Install pymysql (and any other needed packages)
RUN pip install mysql-connector-python

ENTRYPOINT ["python", "-m", "langflow", "run"]
