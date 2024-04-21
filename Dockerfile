FROM alpine
WORKDIR /app
RUN apk --no-cache add postgresql16-client
COPY clean4.sql .
COPY run.sh .
CMD ["sh", "run.sh"]
