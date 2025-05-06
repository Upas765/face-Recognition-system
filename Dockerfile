# Use a base Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies required by dlib and cmake
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    python3-dev \
    libboost-all-dev \
    libopenblas-dev \
    liblapack-dev \
    libx11-dev \
    git \
    && apt-get clean

# Upgrade pip and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Set the command to run your app
CMD ["python", "app.py"]

