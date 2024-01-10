[ "$(grep 'restore phy config' /etc/rc.local)" == "" ] ||
	[ "$(grep -nE "restore phy config" /etc/rc.local | cut -d: -f1)" == "1" ] || {
	sed -i '/restore phy config/{x;p;x}' /etc/rc.local
	sed -i '1,/^$/d' /etc/rc.local
}
if [ -f /etc/base.en.lmo ] || [ -f /etc/base.ru.lmo ]; then
	[ "$(mount| grep '/usr/lib/lua/luci')" == "" ] || umount /usr/lib/lua/luci
	rm /etc/base.*.lmo
	rm -rf /tmp/luci
	luci-reload & rm -r /tmp/luci-indexcache & luci-reload
fi
[ -f /etc/rc.english ] && rm /etc/rc.english
[ -f /etc/rc.lang ] && rm /etc/rc.lang
[ -f /etc/rc.iptv ] && {
    rm /etc/rc.iptv
    switch reg w 2214 10001
    switch vlan set 0 1 11110011
    switch vlan set 1 2 00001101
    switch clear
}
