FROM maven:latest
RUN mvn package
CMD ["mvn"]