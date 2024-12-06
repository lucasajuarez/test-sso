FROM registry.redhat.io/rh-sso-7/sso76-openshift-rhel8:latest
                
COPY extensions/* /opt/eap/extensions/
RUN mkdir -p /opt/eap/modules/system/layers/keycloak/com/softwareag
RUN mkdir -p /opt/eap/modules/system/layers/keycloak/com/softwareag/entirex
RUN mkdir -p /opt/eap/modules/system/layers/keycloak/com/softwareag/entirex/main
COPY lib/softwareag/entirex/main/* /opt/eap/modules/system/layers/keycloak/com/softwareag/entirex/main/
COPY spi/* /opt/eap/standalone/deployments/

USER root
RUN chmod 774 -R /opt/eap/
USER jboss

CMD ["/opt/eap/bin/openshift-launch.sh"]
