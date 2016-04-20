FROM java:8

# Do a general update to help downstream container bulids
RUN \
  apt-get clean && \
  apt-get update && \
  apt-get install -y maven

# Expose port
EXPOSE 8080
