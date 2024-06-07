ARG FORGE_VERSION=1.20.1-47.2.32
ARG FORGE_TEMPALTE=forge-template-$FORGE_VERSION
ARG OVERRIDES_DIR=overrides
ARG OVERRIDES_MODS_DIR=$OVERRIDES_DIR/mods
ARG DI_VERSION=3.0.7.1-1.20.1
ARG DI_JAR=dcintegration-forge-$DI_VERSION.jar

RUN wget https://github.com/ThePansmith/Monifactory/releases/latest/download/server.zip
RUN unzip server.zip
RUN rm server.zip
WORKDIR server
RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-installer.jar
RUN java -jar forge-$FORGE_VERSION-installer.jar --installServer $FORGE_TEMPALTE
RUN rm forge-$FORGE_VERSION-installer.jar
RUN mkdir -p $OVERRIDES_MODS_DIR
RUN wget https://cdn.modrinth.com/data/rbJ7eS5V/versions/ILJrSvYW/$DI_JAR --directory-prefix=$OVERRIDES_MODS_DIR
RUN echo "eula=true" > eula.txt
ADD overrides/
