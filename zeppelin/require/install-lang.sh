#!bin/bash

apk --no-cache add cmake make musl-dev gcc gettext-dev libintl && \
    wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip && \
    unzip musl-locales-master.zip && \
    cd musl-locales-master && \
    cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && \
    make && make install && \
    cd .. && rm -rf musl-locales-master musl-locales-master.zip

apk del --purge cmake make musl-dev gcc gettext-dev libintl && \
    locale -a
