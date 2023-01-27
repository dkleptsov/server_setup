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

# Security settings
~~~~
sudo nano /etc/ssh/sshd_config
~~~~
~~~~
Port 100
PermitRootLogin no
MaxAuthTries 3
PermitEmptyPasswords no
HostbasedAuthentication no
IgnoreRhosts yes
~~~~

# Setting up notifications about ssh logins
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

# Enter env variables
~~~~
cd && sudo nano .bashrc
~~~~
~~~~
#rg_bot_main
export INOAGENT_BOT=''
#rg_bot_test
export TEST_FLIGHT_BOT=''
export PATH=$PATH:/home/dev/rg_tg_bot/monitoring/geckodriver/geckodriver
~~~~

# Install Docker
* [Debian](https://docs.docker.com/engine/install/debian/)
* [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
* [Post install](https://docs.docker.com/engine/install/linux-postinstall/)

# Installing Outline VPN
~~~~
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"
~~~~