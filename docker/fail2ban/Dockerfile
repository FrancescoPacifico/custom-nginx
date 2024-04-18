FROM crazymax/fail2ban:latest

# Copy the custom configuration files.
COPY nginx.conf /etc/fail2ban/jail.d/nginx.conf
COPY nginx-bad-request.conf /etc/fail2ban/filter.d/nginx-bad-request.conf

# Ensure the log file exists.
RUN mkdir -p /var/log/fail2ban
RUN touch /var/log/fail2ban/fail2ban.log