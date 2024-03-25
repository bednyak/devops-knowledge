# Ubuntu 22.04 software installation

- Install Google Chrome browser

Download *.deb from official site and install

- Install Git
```
sudo apt update
sudo apt install git
git config --global user.name "andrew.bednyak"
git config --global user.email "bednyak.ao@gmail.com"
```

- Install Slack
  
Download *.deb from official site and install

- Install snap

By default, snap will be installed on Ubuntu 22.04
Go to 'Ubuntu Software' and check for 'snapd' updated

Add the next row **export DISABLE_WAYLAND=1** to the .bashrc
source ~/.bashrc

- Install Telegram
```
sudo snap install telegram-desktop
```

- Install Skype

Download *.deb from official site and install
  OR

```
sudo snap install skype
```

- Install Postman
```
sudo snap install postman
```

- Install Robo3T
```
sudo snap install robo3t-snap
```

- Install Flameshot

```
sudo apt install flameshot
```

Go to /etc/gdm3/custom.conf

```
sudo nano /etc/gdm3/custom.conf
```

Remove the comment on **#WaylandEnable=false**

Save custom.conf file and restart your machine

- Install NVM and NodeJS

```
sudo apt update
sudo apt install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install [node_version]
```

- Install GoLand

Download GoLand for linux on the official site

```
cd Downloads/
sudo apt update
sudo tar -xzf goland-2021.3.2.tar.gz -C /opt
rm goland-2021.3.2.tar.gz
sudo ln -s /opt/GoLand-2021.3.2/bin/goland.sh /usr/bin/goland
cd /usr/share/applications
sudo bash -c 'echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=GoLand
Comment=GoLand App
Exec=goland
Icon=/opt/GoLand-2023.2.3/bin/goland.svg
Terminal=false
Type=Application
Categories=Application;" >>goland.desktop'
sudo chmod +x goland.desktop
```

- Install Terraform

https://learn.hashicorp.com/tutorials/terraform/install-cli

- Install Ansible
```
sudo apt update
sudo apt install ansible
```

- Install AWS cli

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

- Install OBS - software for recording screen and audio

https://obsproject.com/ru/download

- If can not run video remove gstreamer1.0-vaapi
```
sudo apt remove gstreamer1.0-vaapi
```

- Install Zoom

Download *.deb from official site and install
```
sudo apt install ./zoom_amd64.deb
```

- Install Docker/Docker-Compose
```
sudo apt install docker
sudo apt install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER
systemctl reboot -i
```

- Upgrade Docker-Compose
```
sudo apt-get remove docker-compose // If installed via apt-get
sudo rm /usr/local/bin/docker-compose // If installed via curl
pip uninstall docker-compose // If installed via pip
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod 755 $DESTINATION
```

- Install DBeaver

Download *.deb from official site and install

```
sudo apt install ./dbeaver-ce_21.2.5_amd64.deb
```

- Install MySQL Workbench
```
sudo snap install mysql-workbench-community
```

- Install Pritunl

https://client.pritunl.com/

- Install Pavucontrol
```
sudo apt update
sudo apt install pavucontrol
```

- Install GoLang

Download GoLang from the official site

```
cd Downloads/
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz
sudo nano $HOME/.profile
```

Add the next row **export PATH=$PATH:/usr/local/go/bin** to the .profile
Reboot you PC

go version

- Setup VPN connection

Go to the site https://pkg.cloudflareclient.com/packages/cloudflare-warp and download cloudflare-warp client

Register the client 
```
warp-cli register
```

Connect 
```
warp-cli connect
```

Run and verify that warp=on
```
curl https://www.cloudflare.com/cdn-cgi/trace/ 
```


- Anki - program for learning languages
```
sudo apt update
sudo apt install anki
```

- Install fbreader
```
sudo snap install fbreader
```

- Install KeePassXC

https://keepassxc.org/download/#linux

```
sudo snap install keepassxc
```

OR

```
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update
sudo apt install keepassxc
```

- Install WebStorm

Download WebStorm for linux on the official site

```
cd Downloads/
sudo apt-get update
sudo tar -xzf WebStorm-2017.3.6.tar.gz -C /opt
rm WebStorm-2017.1.6.tar.gz
sudo ln -s /opt/WebStorm-173.4674.64/bin/webstorm.sh /usr/bin/webstorm
cd /usr/share/applications
sudo bash -c 'echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=WebStorm
Comment=WebStorm App
Exec=webstorm
Icon=/opt/WebStorm-173.4674.64/bin/webstorm.svg
Terminal=false
Type=Application
Categories=Application;" >> webstorm.desktop'
sudo chmod +x webstorm.desktop
```
