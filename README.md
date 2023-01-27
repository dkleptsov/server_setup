# Setting up notifications about ssh logins
1. Add bot token and recipient information
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

# Installing Outline VPN
~~~~
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)"
~~~~