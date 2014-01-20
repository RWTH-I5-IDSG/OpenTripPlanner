
cd /opt/git/OpenTripPlanner


git pull



mvn -Dmaven.test.skip=true package


# execute graph builder with graph.xml as config (comment out to only redeploy)
#java -Xmx1024M -jar /opt/git/OpenTripPlanner/opentripplanner-graph-builder/target/graph-builder.jar /root/graph.xml

/etc/init.d/tomcat-7-opentripplanner  stop

# remove any existing deployments
rm -R /var/lib/tomcat-7-opentripplanner/webapps/otp#otp-
rm -R /var/lib/tomcat-7-opentripplanner/webapps/otp#client*

# copy .war files over to tomcat webapps 
find . -name "*.war" | grep -v coder | xargs --replace=STR cp STR /var/lib/tomcat-7-opentripplanner/webapps/
cd /var/lib/tomcat-7-opentripplanner/webapps/
ls *.war | grep -v "otp#" | xargs --replace=STR mv STR otp#STR

# hacky fix for OTP web app
cp /root/config.js /var/lib/tomcat-7-opentripplanner/webapps/otp#client/js/otp/config.js
/etc/init.d/tomcat-7-opentripplanner start

ls -l /var/lib/tomcat-7-opentripplanner/webapps/

cd /opt/git/OpenTripPlanner

mvn clean
