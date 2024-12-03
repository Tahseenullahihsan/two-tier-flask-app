FROM python:3.9-slim
WORKDIR /app
# install required packages for system
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*
# Copy the requirements file into the container
COPY requirements.txt .
RUN pip install mysqlclient
RUN pip install -r requirements.txt
# Copy the rest of the application code
COPY . .
# Specify the command to run your application
CMD ["python", "app.py"]