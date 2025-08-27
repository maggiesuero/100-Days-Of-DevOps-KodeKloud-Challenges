ssh steve@stapp02
sudo yum install java-1.8.0-openjdk-devel tomcat -y # Install Java Development Kit (JDK) and Tomcat

sudo vi /etc/tomcat/server.xml # Configure Tomcat to Use Port 8082 (instead default 8080)

# <Connector port="8082" protocol="HTTP/1.1"
#            connectionTimeout="20000"
#            redirectPort="8443" />


## Deploy the ROOT.war file from the JumpHost

scp /tmp/ROOT.war steve@stapp02:/tmp/


## From App Server 2:

sudo mv /tmp/ROOT.war /var/lib/tomcat/webapps/ # Move the ROOT.war file to the Tomcat webapps directory
sudo systemctl start tomcat
sudo systemctl enable tomcat


## From the JumpHost:

curl http://stapp02:8082 # Verify the webpage works. It will return the HTML content of the webpage