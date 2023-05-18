FROM debian:stable-slim

# Install required dependencies
RUN apt-get update && apt-get install -y curl git unzip xz-utils libglu1-mesa

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:${PATH}"
RUN flutter config --no-analytics && flutter precache

# Set the working directory
WORKDIR /app

# Copy the Flutter web app code into the container
COPY . .

# Build the Flutter web app
RUN flutter build web

# Expose the Flutter web app's default port
EXPOSE 3000

# Run the Flutter web app
CMD ["flutter", "run", "-d", "web-server", "-p", "3000", "--no-sound-null-safety"]
