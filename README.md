# java-component

Docker container for building a Java project that runs an application server on 8080.

## Example component Dockerfile

```
# Check out code from Github


WORKDIR /usr/src
RUN git clone https://github.com/username/my-repo.git .
# Select branch
RUN git checkout release


# Build the component

RUN mvn install -DskipTests


# Add command to the entry point script

RUN echo "java -jar target/*-jar-with-dependencies.jar" >> container.sh
