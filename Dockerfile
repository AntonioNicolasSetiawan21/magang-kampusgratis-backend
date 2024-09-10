# Example Dockerfile snippet
FROM node:16

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install TypeScript globally
# RUN npm install -g typescript

# Copy the rest of the application code
COPY . .

# Compile TypeScript files
#RUN tsc
RUN npm build

# Set the command to run your app
CMD ["node", "dist/server.js"]
