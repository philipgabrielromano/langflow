FROM langflowai/langflow:latest

USER root

# Install packages in one layer
RUN pip install --no-cache-dir \
    pymysql \
    mysql-connector-python \
    snowflake-connector-python[pandas] \
    langchain-pinecone \
    matplotlib \
    seaborn \
    pandas \
    cryptography

USER user

# Keep it simple - let langflow handle the startup
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
