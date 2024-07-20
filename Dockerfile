FROM openjdk:11

VOLUME /output

LABEL original_maintainer="Phillip Booth <phillip.booth@intersystems.com>"
LABEL maintainer="Michael Kahn <Michael.Kahn@cuanschutz.edu>"

ADD ./synthea_dist/synthea.tar /

ENV APP_HOME=/synthea

ENTRYPOINT [ "/synthea/bin/synthea"]
