FROM armdsplayground/base-gui
# Install xterm.
RUN add-pkg midori ssh

LABEL \
  caps_add="NET_ADMIN" 

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
ENV APP_NAME="Midori"

RUN /bin/bash
