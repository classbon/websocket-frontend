# Stage 1: Build stage
FROM node:20-slim as builder

# Set environment variables if necessary
# ENV PNPM_HOME="/pnpm"
# ENV PATH="$PNPM_HOME:$PATH"

# Set working directory
WORKDIR /app

# Copy package.json and pnpm-lock.yaml (if using pnpm)
COPY package.json ./
# COPY pnpm-lock.yaml ./   # Uncomment if using pnpm
RUN npm install -f
# Or use pnpm if configured
# RUN npm install -g pnpm && pnpm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN npm run build
EXPOSE 3000
CMD ["npm",  "start"]
