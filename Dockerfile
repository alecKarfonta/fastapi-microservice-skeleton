# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files into the container
COPY app /app/
COPY tests /app/tests
COPY scripts /app/scripts
COPY requirements.txt /app/requirements.txt

# Custom pip configuration
COPY pip.conf /root/.pip/pip.conf


# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test
# Set the default username and password to "test"
RUN echo 'test:test' | chpasswd

RUN service ssh start


# Expose the port that the application will run on
EXPOSE 8000

# Command to run the application
CMD ["/app/scripts/start.sh"]