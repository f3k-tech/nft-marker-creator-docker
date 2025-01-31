# Base stage for shared environment setup
FROM node:16 AS base

WORKDIR /app

COPY package*.json ./
RUN npm install

# Copy the rest of the files including the libs directory
COPY libs ./libs
COPY app.js ./

COPY ./scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh

# Ensure the WASM file is in the correct location
RUN ls /app/libs # To verify that the file exists during build

CMD ["/bin/bash", "/usr/local/bin/process_images.sh"]
