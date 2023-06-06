#Stage 1 - Install dependencies and build the app in a build environment
FROM debian:latest AS build-env
# Install flutter dependencies
RUN apt-get update && apt-get install -y \
    curl git wget unzip libgconf-2-4 gdb libglu1-mesa \
    fonts-droid-fallback python3 sed && apt-get clean
    
# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
# Set flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"
# Run flutter doctor
RUN flutter doctor -v
RUN flutter channel master
RUN flutter upgrade
# Copy files to container and build
RUN mkdir /app/
COPY ./publish_point_frontend/pp_frontend /app/
WORKDIR /app/
RUN flutter build web
# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine

# Copy nginx.conf to the container
COPY ./publish_point_frontend/pp_frontend/nginx.conf /etc/nginx/nginx.conf

COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]