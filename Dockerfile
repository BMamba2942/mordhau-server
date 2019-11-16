FROM ubuntu

RUN useradd -m steam

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    apt-get install -y lib32gcc1 libfontconfig1 libpangocairo-1.0-0 libnss3 libgconf2-4 libxi6 libxcursor1 libxss1 libxcomposite1 libasound2 libxdamage1 libxtst6 libatk1.0-0 libxrandr2 curl

ADD steamcmd_linux.tar.gz /home/steam
ADD update_mordhau.txt /home/steam
ADD Game.ini /home/steam/mordhau/Mordhau/Saved/Config/LinuxServer/Game.ini
RUN chown steam:root -R /home/steam
USER steam
WORKDIR /home/steam
RUN ./steamcmd.sh +login anonymous +runscript update_mordhau.txt
ENTRYPOINT ["./mordhau/MordhauServer.sh"]
        



