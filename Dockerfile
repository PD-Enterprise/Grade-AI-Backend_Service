FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Copy your application
COPY . .

# Create a virtual environment and install Python dependencies
RUN pip3 install Flask

# Start script
COPY start-docker.sh /start-docker.sh
RUN chmod +x /start-docker.sh

CMD ["/start-docker.sh"]