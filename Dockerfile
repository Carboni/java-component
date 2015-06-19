from java:7

# Install git and maven

RUN \
  apt-get clean && \
  apt-get update && \
  apt-get install -y git maven 

# Consul agent - /usr/local/bin

ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/0.5.2_linux_amd64.zip
WORKDIR /usr/local/bin
RUN unzip /tmp/0.5.2_linux_amd64.zip
WORKDIR /etc/consul.d
RUN echo '{"service": {"name": "florence", "tags": ["blue"], "port": 8080, "check": {"script": "curl http://localhost:8080 >/dev/null 2>&1", "interval": "10s"}}}' > florence.json

# Expose port

EXPOSE 8080

# Build the base entry point script

RUN echo "#!/bin/bash" >> container.sh
# Disabled for now: RUN echo "consul agent -data-dir /tmp/consul -config-dir /etc/consul.d -join=dockerhost &" > container.sh
RUN chmod u+x container.sh

ENTRYPOINT ["./container.sh"]
