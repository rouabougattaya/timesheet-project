FROM alpine:latest

ENV JAVA_HOME=/usr/lib/jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apk add --no-cache wget tar bash musl-locales musl-locales-lang \
    && wget -q -O jdk.tar.gz https://aka.ms/download-jdk/microsoft-jdk-17-alpine-x64.tar.gz \
    && mkdir -p $JAVA_HOME \
    && tar xzf jdk.tar.gz -C $JAVA_HOME --strip-components=1 \
    && rm jdk.tar.gz

WORKDIR /app

COPY target/timesheet-devops-1.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
