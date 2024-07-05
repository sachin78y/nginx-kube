# Use the official Nginx image as the base image
FROM nginx:latest

# Create necessary directories and set permissions
RUN mkdir -p /var/cache/nginx/client_temp /var/run/nginx \
    && chmod -R 777 /var/cache/nginx /var/run/nginx /var/run/
    
# Copy custom Nginx configuration file to the container
ADD https://github.com/sachin78y/docker-images/raw/master/nginx.conf /tmp
RUN cp  /tmp/nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /tmp/nginx.conf

RUN echo "Welcome to hitachi"  > /usr/share/nginx/html/index.html

# Expose port 8080
EXPOSE 8080
