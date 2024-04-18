FROM node:latest

# Install log.io file input.
RUN npm install -g log.io-file-input

# Copy the custom configuration file.
COPY file-input.json /file.json

# Run log.io file input.
CMD ["log.io-file-input"]