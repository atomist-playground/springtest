# Test
FROM maven:3-openjdk-11-slim AS build

WORKDIR /mvn

COPY . /mvn/

RUN mvn install

FROM gcr.io/distroless/java:11

WORKDIR /app

COPY --from=build /mvn/target/demo-0.0.1-SNAPSHOT.jar /app/

CMD [ "/app/demo-0.0.1-SNAPSHOT.jar" ]
