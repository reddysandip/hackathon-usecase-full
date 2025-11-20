# -------- BUILD STAGE --------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy only pom.xml first (for layer caching)
COPY pom.xml .

# Pre-download dependencies (fast rebuilds)
RUN mvn -B dependency:go-offline

# Copy source code
COPY src ./src

# Build the JAR (skip tests for speed)
RUN mvn -B package -DskipTests


# -------- RUNTIME STAGE --------
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy only the final jar
COPY --from=build /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
