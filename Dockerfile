FROM nginx
# Install File Package
RUN apt update && apt install -y file 
# Install Vim for Debug
RUN apt install -y vim

# 
RUN cd /var && mkdir concentration
# Copy everything from site
COPY ./html /var/concentration/html/
# Copy nginx conf
COPY ./conf/nginx.conf /etc/nginx

COPY ./start.sh /

# Make the script executable
RUN chmod +x /start.sh


EXPOSE 80


ENTRYPOINT ["/start.sh"]
