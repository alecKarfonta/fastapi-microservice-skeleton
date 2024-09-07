#!/bin/bash


set -x  # Enable verbose mode

# Print current PATH
echo "Current PATH: $PATH"

# Print Python version
python3 --version

# Print pip list
pip3 list

# Print uvicorn version and location
which uvicorn
uvicorn --version

# Start the SSH service
service ssh start

# Start the uvicorn server
uvicorn main:app --host 0.0.0.0 --port 8000 --reload


set +x  # Disable verbose mode