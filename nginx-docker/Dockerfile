FROM jc21/nginx-proxy-manager:latest

# Define the email address for ngxblocker cron job.
ARG EMAIL

# Install necessary packages in one layer and clean up.
RUN apt-get update && apt-get install -y \
    wget \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# Download and set up ngxblocker.
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker \
    && chmod +x /usr/local/sbin/install-ngxblocker \
    && /usr/local/sbin/install-ngxblocker -x \
    && chmod +x /usr/local/sbin/setup-ngxblocker \
    && chmod +x /usr/local/sbin/update-ngxblocker

# Setup nginx host and configure ngxblocker.
COPY dummy.conf /data/nginx/dummy_host/dummy.conf
RUN mkdir -p /data/nginx/dummy_host \
    && /usr/local/sbin/setup-ngxblocker -x -z -v /data/nginx/dummy_host -e conf \
    && rm -rf /data/nginx/dummy_host

# Configure cron job for updating ngxblocker.
RUN (crontab -l 2>/dev/null; echo "00 22 * * * /usr/local/sbin/update-ngxblocker -e ${EMAIL}") | crontab -

# Add custom setup script and modify .bashrc.
COPY custom-setup-ngxblocker.sh /usr/local/sbin/custom-setup-ngxblocker.sh
RUN chmod +x /usr/local/sbin/custom-setup-ngxblocker.sh \
    && sed -i '/^alias/!b;:a;n;/^alias/ba; i alias setup-ngxblocker="/usr/local/sbin/custom-setup-ngxblocker.sh"' /root/.bashrc

# Set the working directory for the container.
WORKDIR /app
