ARG IMAGE=store/intersystems/iris-community:2020.1.0.204.0
ARG IMAGE=intersystemsdc/iris-community:2020.1.0.209.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.2.0.204.0-zpm
ARG IMAGE=intersystemsdc/irishealth-community:2020.3.0.200.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.3.0.221.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.4.0.547.0-zpm
ARG IMAGE=containers.intersystems.com/intersystems/iris:2021.1.0.215.0
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}

#COPY  Installer.cls .
COPY  src src
COPY Installer.cls Installer.cls
COPY module.xml module.xml
COPY iris.script iris.script

# config file to generate openssl certificate
COPY example-com.conf example-com.conf

# to use with symmetric encrypt/decrypt
ENV SECRETKEY=InterSystemsIRIS

# to use with asymmetric encrypt/decrypt
RUN openssl req  -new -x509 -sha256 -config example-com.conf -newkey rsa:2048 -nodes -keyout example-com.key.pem  -days 365 -out example-com.cert.pem

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly
