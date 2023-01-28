# Adding non root user
1. Change root password
~~~~
sudo passwd root
~~~~
2. Check unwanted users
~~~~
less /etc/passwd
~~~~
3. Add non root sudo user
~~~~
adduser dev
~~~~
~~~~
adduser dev sudo
~~~~

# Update system
~~~~
sudo apt-get update
~~~~
~~~~
sudo apt-get upgrade
~~~~

# Adding ssh key to server
1. On a remote
~~~~
cd && mkdir .ssh
~~~~
2. On local machine
~~~~
scp /Users/dev/.ssh/key.pub dev@server:/home/dev/.ssh/uploaded_key.pub
~~~~
3. On a remote
~~~~
cat ~/.ssh/uploaded_key.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/*
~~~~

# Git config
~~~~
git config --global user.name "name"
git config --global user.email "email"
~~~~

# Security settings
~~~~
sudo nano /etc/ssh/sshd_config
~~~~
~~~~
Port 100
LoginGraceTime 2m
PermitRootLogin no
MaxAuthTries 4
AuthorizedKeysFile      .ssh/authorized_keys 
HostbasedAuthentication no
IgnoreRhosts yes
PasswordAuthentication no
PermitEmptyPasswords no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
UsePAM no
~~~~
~~~~
sudo systemctl reload ssh
~~~~

# Enter env variables
~~~~
cd && sudo nano .bashrc
~~~~
~~~~
#convenience
alias ll='ls -alF'
#rg_bot_main
export INOAGENT_BOT=''
#rg_bot_test
export TEST_FLIGHT_BOT=''
export PATH=$PATH:/home/dev/rg_tg_bot/monitoring/geckodriver/geckodriver
~~~~

# Install Docker
* [Debian](https://docs.docker.com/engine/install/debian/) [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
* [Post install](https://docs.docker.com/engine/install/linux-postinstall/)

# Installing Outline VPN
~~~~
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"
~~~~

# Setting up telegram notifications about ssh logins
1. Add bot token and recipient information in telegram-send.sh
~~~~
NOTIFICATION_BOT=""
~~~~
2. Add permissions for send_telegram
~~~~
chmod +x telegram-send.sh
~~~~
3. Test sending of telegram messages
~~~~
./telegram-send.sh "Test message"
~~~~
4. Move it to bin folder to use from everywhere
~~~~
sudo cp telegram-send.sh /usr/bin/telegram-send
~~~~
5. Owner of all files in /usr/bin is root user. So let’s do the same with our script
~~~~
sudo chown root:root /usr/bin/telegram-send
~~~~
6. Prepare script to catch logins events:
~~~~
chmod +x login-notify.sh
~~~~
7. Copy script 
~~~~
sudo cp login-notify.sh /etc/profile.d/login-notify.sh
~~~~
