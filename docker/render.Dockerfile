FROM langflowai/langflow:latest

USER root
RUN pip install --no-cache-dir pymysql mysql-connector-python
USER user

ENV PYTHONPATH=/app/data/.local/lib/python3.12/site-packages:$PYTHONPATH

ENTRYPOINT ["python", "-m", "langflow", "run"]
