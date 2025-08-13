FROM langflowai/langflow:latest

USER root
RUN pip install --no-cache-dir pymysql mysql-connector-python snowflake-connector-python
USER user

# Add the system site-packages path that's missing from the venv
ENV PYTHONPATH="/usr/local/lib/python3.12/site-packages:/app/data/.local/lib/python3.12/site-packages:$PYTHONPATH"

# Verify both work
RUN python -c "import pymysql; print('PyMySQL:', pymysql.__version__)"
RUN python -c "import mysql.connector; print('MySQL Connector:', mysql.connector.__version__)"

ENTRYPOINT ["python", "-m", "langflow", "run"]
