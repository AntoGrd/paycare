# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install system dependencies (optional but often useful)
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Copy ETL script (and optionally sample CSVs if present)
COPY etl.py .

# Copy requirements if you have one, otherwise install pandas directly
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
#RUN pip install --no-cache-dir pandas

# Run the application
CMD ["python", "etl.py"]
