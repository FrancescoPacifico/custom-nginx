FROM node:latest

# Install log.io file input.
RUN npm install -g log.io-file-input

# Copy the custom configuration file and the entrypoint script.
COPY file-input.json /file-input.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run log.io file input.
CMD ["./entrypoint.sh"]