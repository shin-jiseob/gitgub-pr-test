FROM openjdk:17-alpine
LABEL maintainer="Stockeeper Engineering"

# Jar 파일 경로
ARG JAR_FILE_PATH=build/libs/*.war

# Jar 파일 복제
COPY ${JAR_FILE_PATH} app.war

# Java Options 설정
ARG JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Dspring.profiles.active=$ACTIVE_PROFILE"

RUN echo "ACTIVE_PROFILE=${ACTIVE_PROFILE}"
RUN echo "JAVA_OPTS=${JAVA_OPTS}"

ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar app.war"]