FROM ubuntu:latest
LABEL authors="aliakseiharabchuk"

# TEST
ENTRYPOINT ["top", "-b"]