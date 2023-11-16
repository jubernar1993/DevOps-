!/bin/bash
# //This configuration file is to install jenkins in amazon linux!!!

##Add the enviroment variables to the .bash_profile and #source .bash_profile once edited

#///variable M2_HOME="/opt/maven" M2="/opt/maven/bin"      modify PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2





sudo -i
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
sudo tar -xf apache-maven-3.9.5-bin.tar.gz
rm -rf apache-maven-3.9.5-bin.tar.gz
mv apache-maven-3.9.5/ maven
mv maven /opt/
yum install httpd -y
systemctl start httpd
systemctl enable httpd 
yum install git -y
cd /home
git clone https://github.com/jubernar1993/DevOps-.git
cd DevOps-
rm -rf /root/.bash_profile
cp .bash_profile /root/
source /root/.bash_profile
rm -rf /home/DevOps-
echo "<h1>SERVER IS UP AND RUNNING PLEASE GIVE JENKINS A FEW MINS TO BOOTUP</h1>" > /var/www/html/index.html
