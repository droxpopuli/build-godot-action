FROM ubuntu:bionic
LABEL author="droxpopuli@gmail.com"

# Prerequisites
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    python \
    python-openssl \
    unzip \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Install Butler
ADD getbutler.sh /opt/butler/getbutler.sh
RUN bash /opt/butler/getbutler.sh
RUN /opt/butler/bin/butler -V
ENV PATH="/opt/butler/bin:${PATH}"

# Install Godot Stable
ENV GODOT_STABLE "3.2"
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_STABLE}/Godot_v${GODOT_STABLE}-stable_linux_headless.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_STABLE}/Godot_v${GODOT_STABLE}-stable_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir -p ~/.config/godot \
    && mkdir -p /opt/godot/templates/${GODOT_STABLE}.stable \
    && unzip Godot_v${GODOT_STABLE}-stable_linux_headless.64.zip \
    && mv Godot_v${GODOT_STABLE}-stable_linux_headless.64 /usr/local/bin/godot-stable \
    && unzip Godot_v${GODOT_STABLE}-stable_export_templates.tpz \
    && mv templates/* /opt/godot/templates/${GODOT_STABLE}.stable \
    && rm -f Godot_v${GODOT_STABLE}-stable_export_templates.tpz Godot_v${GODOT_STABLE}-stable_linux_headless.64.zip

# Instal Godot Latest
ENV GODOT_LATEST "3.2.1"
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_LATEST}/Godot_v${GODOT_LATEST}-stable_linux_headless.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_LATEST}/Godot_v${GODOT_LATEST}-stable_export_templates.tpz \
    && mkdir -p /opt/godot/templates/${GODOT_LATEST}.stable \
    && unzip Godot_v${GODOT_LATEST}-stable_linux_headless.64.zip \
    && mv Godot_v${GODOT_LATEST}-stable_linux_headless.64 /usr/local/bin/godot-latest \
    && unzip Godot_v${GODOT_LATEST}-stable_export_templates.tpz \
    && mv templates/* /opt/godot/templates/${GODOT_LATEST}.stable \
    && rm -f Godot_v${GODOT_LATEST}-stable_export_templates.tpz Godot_v${GODOT_LATEST}-stable_linux_headless.64.zip