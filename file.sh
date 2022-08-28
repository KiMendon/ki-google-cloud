sudo apt update
sleep 10
sudo apt install apache2 -y
sudo bash -c 'echo "Hi Ki, I am from `hostname`" > /var/www/html/index.html'
/etc/init.d/apache2 restart

