# Use a valid Node.js image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy all application files
COPY . .

# Run the build script (ensure 'build' is defined in package.json)
RUN npm run build

# Expose the port the app runs on
EXPOSE 8080

# Run the application (update path based on actual build output)
CMD ["node", "dist/server.js"]
