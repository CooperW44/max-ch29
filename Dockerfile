# Use a stable LTS version of Node.js (20-alpine recommended for minimal size)
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first for caching optimization
COPY package*.json ./

# Install dependencies (production only for a leaner image)
RUN npm install --production

# Copy the rest of your app files
COPY . .

# Expose the correct application port (ensure your app actually listens on this port)
EXPOSE 3000

# Use a non-root user for better security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Clearly defined start command
CMD ["npm", "start"]