# Base stage for shared environment setup
FROM node:16 AS base

WORKDIR /app

COPY package*.json ./
RUN npm install

# Copy the rest of the files including the libs directory
COPY . .

# Ensure the WASM file is in the correct location
RUN ls /app/libs # To verify that the file exists during build

CMD ["node", "app.js", "-i", "input/house.jpg"]
