FROM ubuntu:latest
LABEL authors="aliakseiharabchuk"

ENTRYPOINT ["top", "-b"]