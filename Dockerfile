FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    python3-venv

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Copy your application
COPY . .

# Create a virtual environment and install Python dependencies
RUN python3 -m venv /env && \
    . /env/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Start script
COPY start-docker.sh /start-docker.sh
RUN chmod +x /start-docker.sh

CMD ["/start-docker.sh"]