FROM maven:3.8.3-openjdk-17 as build

WORKDIR /app
COPY . .
RUN mvn install -DskipTests=true

FROM eclipse-temurin:17.0.8.1_1-jre-ubi9-minimal

WORKDIR /run
COPY --from=build /app/target/shoe-ShopingCart-0.0.1-SNAPSHOT.jar /run/filename.jar

EXPOSE 8080

ENTRYPOINT java -jar /run/filename.jar