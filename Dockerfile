#FROM nginx:latest

#COPY build/web/ /usr/share/nginx/html

#COPY assets/ /usr/share/nginx/html/assets

#EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]

# Use the official Flutter image as the base image
FROM ghcr.io/cirruslabs/flutter:3.13.7 as build

# Dockerfile
ARG ENV_CONTENT
RUN echo "$ENV_CONTENT" > dotenv

# Set environment variables from the .env file
ENV BASE_URL_K=$BASE_URL_K
ENV BASE_URL_P=$BASE_URL_P
ENV BASE_URL_A=$BASE_URL_A
ENV BASE_URL_D=$BASE_URL_D
ENV BASE_URL_B=$BASE_URL_B
ENV BASE_HEAD=$BASE_HEAD
ENV BASE_KEY=$BASE_KEY

# Set the working directory
WORKDIR /app

# Copy the pubspec.* files to leverage Docker’s caching mechanism
COPY pubspec.* ./

# Get the dependencies (you might want to add more commands here depending on your project)
RUN dart pub get

# Copy the entire project
COPY . .

# Build the Flutter web app
RUN dart pub get && \
    dart pub global activate webdev 

RUN flutter build web --release --web-renderer html

# Use NGINX as a lightweight HTTP server
FROM nginx:alpine

# Copy the built web app from the previous stage into NGINX's html directory
COPY --from=build /app/build/web /usr/share/nginx/html

COPY assets/ /usr/share/nginx/html/assets

# Expose port 80
EXPOSE 80

# Start NGINX server when the container starts
CMD ["nginx", "-g", "daemon off;"]
