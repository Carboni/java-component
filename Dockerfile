from java:8

# Do a general update to help downstream container bulids
RUN \
  apt-get clean && \
  apt-get update

# Expose port
EXPOSE 8080

# Build the base entry point script
WORKDIR /usr/entrypoint
RUN echo "#!/bin/bash" >> container.sh
RUN chmod u+x container.sh

ENTRYPOINT ["./container.sh"]
