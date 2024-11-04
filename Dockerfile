FROM ubuntu:noble

WORKDIR /work

RUN apt update && \
    apt -y upgrade && \
    apt -y install \
    groff \
    fontforge-nox \
    fonts-sawarabi-gothic \
    fonts-sawarabi-mincho \
    man-db \
    manpages-ja \
    manpages-ja-dev \
    language-pack-ja \
    language-pack-ja-base \
    unminimize
RUN yes | unminimize

RUN locale-gen $(cut -d' ' -f1 /usr/share/i18n/SUPPORTED | grep ja_JP)
RUN update-locale LANG=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8

COPY ./font-install.sh /work/
RUN chmod +x ./font-install.sh

RUN ./font-install.sh /usr/share/fonts/truetype/sawarabi-mincho/sawarabi-mincho-medium.ttf M
RUN ./font-install.sh /usr/share/fonts/truetype/sawarabi-gothic/sawarabi-gothic-medium.ttf G

COPY ps.tmac /usr/share/groff/site-tmac/

COPY ./do.sh /work/
RUN chmod +x ./do.sh

COPY ./man.sh /work/
RUN chmod +x ./man.sh

COPY ./man-all.sh /work/
RUN chmod +x ./man-all.sh

RUN ln -s /work/man.sh /usr/local/bin/do-man
RUN ln -s /work/man-all.sh /usr/local/bin/do-man-all
RUN ln -s /work/do.sh /usr/local/bin/do-print

ENTRYPOINT ["do-print"]
