FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cowsay \
    fortune-mod \
    fortunes \
    netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up cowsay and fortune
RUN ln -s /usr/games/cowsay /usr/bin/cowsay && \
    ln -s /usr/games/fortune /usr/bin/fortune

WORKDIR /app

# Copy the script
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the port used in the script
EXPOSE 4499

# Run the script
CMD ["/bin/bash", "/app/wisecow.sh"]
