FROM openjdk:8-jre 

WORKDIR /usr/app/minecraft

RUN wget -O "mc_file.zip" "https://mediafilez.forgecdn.net/files/4422/376/Better%20MC%20FORGE%20Server%20Pack%201.16.5%20v60.5.zip"

RUN unzip "mc_file.zip" -d unziped_folder && \
    mv unziped_folder/* .

RUN rm -rf unziped_folder mc_file.zip && \
    echo 'eula=true' > eula.txt

COPY --chmod=777 ./server.properties ./server.properties

COPY --chmod=777 ./install.sh ./install.sh

EXPOSE 25565

CMD ["./install.sh"]
