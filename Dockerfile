# Base stage
FROM ubuntu:20.04 AS base
RUN useradd -m abc
RUN apt-get update && apt-get install -y cron
RUN mkdir -p /app/data && chown abc:abc /app/data

# Intermediate stage
FROM base AS intermediate
COPY manage_folder.sh /app/
RUN chmod +x /app/manage_folder.sh
RUN echo "* * * * * /app/manage_folder.sh" | crontab -u abc -

# Clear up stage
FROM intermediate AS cleanup
USER abc
RUN /app/manage_folder.sh 0

# Create stage
FROM intermediate AS create
USER abc
RUN /app/manage_folder.sh 1
