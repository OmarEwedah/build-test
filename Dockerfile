FROM maven:latest
WORKDIR /app
ADD . /app
RUN mvn package
CMD ["mvn"]