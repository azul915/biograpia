FROM openjdk:16-slim AS dev
ENV SRC /usr/local/kotlin
ENV GRADLE_VERSION 7.1
ENV PATH /usr/local/gradle-$GRADLE_VERSION/bin:$PATH

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip && \
    wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-${GRADLE_VERSION}-bin.zip -d /usr/local && \
    rm gradle-${GRADLE_VERSION}-bin.zip && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
