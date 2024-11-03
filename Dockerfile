FROM ubuntu:noble

WORKDIR /work

RUN apt update && \
    apt -y upgrade && \
    apt -y install \
    groff \
    fontforge-nox \
    fonts-sawarabi-gothic \
    fonts-sawarabi-mincho

COPY ./font-install.sh /work/
RUN chmod +x ./font-install.sh

RUN ./font-install.sh /usr/share/fonts/truetype/sawarabi-mincho/sawarabi-mincho-medium.ttf M
RUN ./font-install.sh /usr/share/fonts/truetype/sawarabi-gothic/sawarabi-gothic-medium.ttf G

COPY ./do.sh /work/
RUN chmod +x ./do.sh

# ENTRYPOINT ["groff", "-Dutf8", "-F", '"/root/.local/groff/font"']
ENTRYPOINT ["./do.sh"]
# ENTRYPOINT ["sleep", "infinity"]
