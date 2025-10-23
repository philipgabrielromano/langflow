FROM langflowai/langflow:latest

# Install as user to ensure packages are in the right location
USER user

# Install to user site-packages
RUN pip install --user --no-cache-dir \
    pymysql \
    mysql-connector-python \
    snowflake-connector-python[pandas] \
    langchain-pinecone \
    matplotlib \
    seaborn \
    pandas \
    cryptography

# Ensure user site-packages is in path
ENV PYTHONPATH="${HOME}/.local/lib/python3.12/site-packages:$PYTHONPATH"
ENV PATH="${HOME}/.local/bin:$PATH"

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
