# Use an official Node.js 14 image as a base
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the package*.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire src directory to the working directory
COPY src/. .

# Salin file server.js ke direktori dist
RUN cp -r . dist/

# Buka port yang digunakan aplikasi
EXPOSE 8080

# Jalankan aplikasi
CMD ["node", "dist/app.js"]