FROM node:latest

# Install log.io server.
RUN npm install -g log.io

# Copy the custom configuration file.
COPY server.json /server.json

# Run log.io server.
CMD ["log.io-server"]