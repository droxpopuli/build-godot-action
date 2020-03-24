FROM droxpopuli/godot-ci:1.1
# GODOT_STABLE inheret from base image
# GODOT_LATEST inheret from base image

# Install Entrypoint
ADD entrypoint.sh /opt/godot-ci/entrypoint.sh
RUN chmod +x /opt/godot-ci/entrypoint.sh
ENV PATH="/opt/godot-ci:${PATH}"

COPY . ./
ENTRYPOINT ["entrypoint.sh"]

