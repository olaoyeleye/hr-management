                   sudo apt install  software-properties-common gnupg2 curl
                   curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
                   sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
                   sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                   sudo apt install terraform -y   




                   sudo apt update -y
sudo apt install openjdk-11-jdk -y

#curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

# sudo gpg --keyserver  http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key --recv-keys 5BA31D57EF5975CA
sudo apt update
sudo apt install jenkins -y

sudo systemctl enable --now jenkins
sudo ufw allow 8080
sudo ufw enable
sudo usermod -aG docker jenkins


sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo apt update -y
sudo usermod -aG docker $USER

sudo apt update -y
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
