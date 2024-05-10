# syntax=docker/dockerfile

# Base build image
FROM ghcr.io/amperecomputingai/release-aio-pytorch:1.10.0
RUN apt -y update

# Install vectordb
RUN pip install install chromadb==0.5.0

# Install LlamaIndex LangChain packages
RUN pip install install langchain==0.1.19
RUN pip install sentence-transformers==2.7.0
RUN pip install llama-index==0.10.36
RUN pip install llama-index-embeddings-huggingface==0.2.0
RUN pip install llama-index-llms-llama-cpp==0.1.3
RUN pip install llama-index-readers-file==0.1.22
RUN pip install llama-index-vector-stores-chroma==0.1.8
RUN pip install pydantic==1.10.11
RUN pip install unstructured==0.13.7
RUN pip install psycopg2-binary pgvector asyncpg "sqlalchemy[asyncio]" greenlet

# Build llama-cpp-python
SHELL ["/bin/bash", "-c"]
WORKDIR /app
COPY ./repos/llama-cpp-python/ /app/
COPY ./build-llama-cpp-python.sh /app/
RUN /app/build-llama-cpp-python.sh

RUN pip install --upgrade https://ampereaidevelopus.s3.amazonaws.com/releases/1.10.0/binaries/torch-2.1.0a0%2Bgite0a1120-cp310-cp310-linux_aarch64.whl  

# Copy llm apps
COPY ./repos/llm_app_frameworks/langchain/  /app/
COPY ./repos/llm_app_frameworks/llamaindex/ /app/
RUN rm -rf /app/README.md

# Update default message
COPY ./print_logo.py /.aio_init/

