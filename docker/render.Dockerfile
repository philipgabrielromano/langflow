FROM langflowai/langflow:latest

# Create a startup script
USER root
RUN echo '#!/bin/bash\n\
pip install --user --no-cache-dir \
    pymysql \
    mysql-connector-python \
    snowflake-connector-python[pandas] \
    langchain-pinecone \
    matplotlib \
    seaborn \
    pandas \
    cryptography\n\
exec langflow run --host 0.0.0.0 --port 7860' > /startup.sh && \
    chmod +x /startup.sh

USER user
CMD ["/startup.sh"]
