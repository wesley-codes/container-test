# Stage 1: Build Stage
FROM node:14-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 2: Production Stage
FROM node:14-alpine

WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=build /app/package.json ./
COPY --from=build /app/node_modules ./node_modules/
COPY --from=build /app/.next ./.next/

# Expose the port Next.js runs on
EXPOSE 3000

# Start the Next.js application in production mode
CMD ["npm", "start"]
