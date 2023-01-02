FROM alpine:latest

RUN apk add --no-cache bash tzdata python3 py3-pip
RUN pip install lastversion 

WORKDIR /app

ENV SERVER unknown

ENV PHANTOM_VER latest

ENV PHANTOM_ARCH x64

ADD entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
