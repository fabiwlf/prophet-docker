FROM python:3.7.10-slim As prophet-docker-ci
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH=/root/.local/bin:$PATH

RUN apt-get update && \
    apt-get install --no-install-recommends -y gcc cmake g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


COPY requirements.txt ./
RUN pip install --user -r requirements.txt && \
    pip install --user prophet

FROM python:3.7.10-slim AS prophet-docker
COPY --from=prophet-docker-ci /root/.local /root/.local

# Copy example
WORKDIR /app
COPY example/ ./

# Make sure scripts in .local are usable:
ENV PATH=/root/.local/bin:$PATH
CMD ["python", "./app.py"]
