[ "$(grep 'rc.iptv' /etc/rc.local)" == "" ] && {
	echo "switch reg w 2214 10002" > /etc/rc.iptv
	echo "switch vlan set 0 1 11010011" >> /etc/rc.iptv
	echo "switch vlan set 1 2 00101101" >> /etc/rc.iptv
	echo "switch clear" >> /etc/rc.iptv
	chmod +x /etc/rc.iptv
	sed -i "1s|^|[ -f /etc/rc.iptv ] \&\& sh /etc/rc.iptv\n|" /etc/rc.local
	chmod +x /etc/rc.local
	/etc/rc.local
}
