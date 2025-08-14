sudo mv Hypr_conf/99-keychron.rules /etc/udev/rules.d/ 

sudo udevadm control --reload-rules\
sudo udevadm trigger\
