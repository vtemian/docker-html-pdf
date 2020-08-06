FROM python:3.8-alpine3.11

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add jpeg-dev zlib-dev libjpeg inotify-tools \
    && pip3 install xhtml2pdf \
    && apk del build-deps

RUN apk add git make g++ \
    && git clone https://github.com/sillypog/inotify-proxy.git /opt/inotify \
    && cd /opt/inotify/ && make && mv /opt/inotify/bin/inotify-proxy /opt/init \
    && rm -rf /opt/inotify

COPY docker /

WORKDIR /opt/html-to-pdf/

ENV HTML_TO_RENDER /opt/html-to-pdf/input.html
ENV OUTPUT_PDF /opt/html-to-pdf/output.pdf

ENTRYPOINT ["/entrypoint.sh"]
