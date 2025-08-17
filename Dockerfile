# Use a slim Python base image for a smaller image size
FROM python:3.10-slim

# Set environment variables for Python to prevent byte code generation and unbuffered output
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install essential tools
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Create and set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire Django project into the working directory
COPY . /app/

# Expose the default Django development server port
EXPOSE 8000
