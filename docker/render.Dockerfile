FROM langflowai/langflow:latest

USER root
RUN pip install --no-cache-dir pymysql
USER user

ENTRYPOINT ["python", "-m", "langflow", "run"]
