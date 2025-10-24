FROM langflowai/langflow:latest
USER user

# Install packages to user site-packages
RUN pip install --user --no-cache-dir \
    pymysql \
    mysql-connector-python \
    snowflake-connector-python[pandas] \
    langchain-pinecone \
    matplotlib \
    seaborn \
    pandas \
    cryptography

# Set the correct PYTHONPATH for this specific container
ENV PYTHONPATH="/app/data/.local/lib/python3.12/site-packages:$PYTHONPATH"
ENV PATH="/app/data/.local/bin:$PATH"

CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
