
# Use a base image with Java installed
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /opt/gatling

# Copy your locally downloaded Gatling bundle to the container
COPY gatling /opt/gatling/gatling

# Expose the results directory
VOLUME /opt/gatling/gatling/results

# Set PATH so gatling.sh can be easily called
ENV PATH="/opt/gatling/gatling/bin:${PATH}"

# Define the command to run Gatling by default, you can override this
ENTRYPOINT ["gatling.sh"]
