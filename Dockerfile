FROM node:latest AS BUILD_IMAGE

# Set the working directory
WORKDIR /app

# Clone the repository and navigate into it
RUN git clone https://github.com/wesley-codes/container-test.git  \ 
 && cd /app/container-test/  \
&& echo"I am Done"
# # Stage 2: Runtime stage
# FROM node:latest
# WORKDIR /app

# # Copy only necessary artifacts from the BUILD_IMAGE stage
# COPY --from=BUILD_IMAGE /app/dist ./dist
# COPY --from=BUILD_IMAGE /app/package*.json ./

# # Install production dependencies
# RUN npm install 

# # Expose the port that the app will run on
# EXPOSE 3000

# # Start the application
# CMD ["npm", "start"]
