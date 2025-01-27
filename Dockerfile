FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y curl python3 python3-pip

# Install Ollama
RUN curl -fsSL https://ollama.ai/install.sh | sh

# Copy your application
COPY . .

# Install Python dependencies
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Start script
COPY start-docker.sh /start-docker.sh
RUN chmod +x /start-docker.sh

CMD ["/start-docker.sh"]