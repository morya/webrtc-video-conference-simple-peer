# Use a lightweight Node.js image 
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and .env dependencies
COPY package.json package-lock.json .


# Install necessary system packages and dependencies
RUN apk add --no-cache \
    bash \
    vim \
    && npm install \
    && npm cache clean --force \
    && rm -rf /tmp/* /var/tmp/* /usr/share/doc/*

# Copy the application code
COPY src src
COPY public public

# Set default command to start the application
CMD ["npm", "start"]