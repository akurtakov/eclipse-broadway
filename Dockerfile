FROM fedora:28
ENV LANG en_GB.UTF-8
RUN useradd me
RUN dnf install -y mutter gnome-settings-daemon wget java fontconfig urw-base35*
RUN echo "Downloading Eclipse"
RUN wget -O ~/eclipse.tar.gz "http://mirrors.nic.cz/eclipse/eclipse/downloads/drops4/R-4.9-201809060745/eclipse-SDK-4.9-linux-gtk-x86_64.tar.gz"
RUN echo "Unzipping Eclipse"
RUN tar xzf ~/eclipse.tar.gz -C ~
COPY ./init.sh /
RUN chmod a+x init.sh
RUN fc-cache -f -v
CMD [ "/init.sh" ]
