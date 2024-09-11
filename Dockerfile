# Stage 1: Build
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies 
RUN npm install

# Install TypeScript globally
RUN npm install -g typescript

# Copy source code
COPY . .

#  Compile TypeScript files
RUN tsc

# Stage 2: Run
#FROM node:16-slim

# Set working directory
#WORKDIR /app

# Copy only the necessary files from the builder stage
#COPY --from=builder /app/dist /app/dist
#COPY --from=builder /app/node_modules /app/node_modules
#COPY --from=builder /app/package*.json /app/

EXPOSE 500

# Set the command to run your app
CMD ["node", "dist/server.js"]
