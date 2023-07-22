FROM jetbrains/qodana-php
ARG VERSION
COPY plugins/toml /opt/idea/plugins/toml
COPY plugins/move/${VERSION} /opt/idea/plugins/intellij-move-${VERSION}
COPY config /.move_config
COPY .build/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]