if [ `ls /tmp/base.*.lmo |wc -l` -ge 1 ]; then
	[ "$(mount| grep '/usr/lib/lua/luci')" == "" ] || umount /usr/lib/lua/luci
	[ -f /usr/lib/lua/luci/i18n/base.en.lmo ] && rm /tmp/base.en.lmo
	mv /tmp/base.*.lmo /etc/
	[ "$(grep 'rc.lang' /etc/rc.local)" == "" ] && {
		echo "[ \`ls /etc/base.*.lmo |wc -l\` -ge 1 ] && {" > /etc/rc.lang
		echo "cp -rf /usr/lib/lua/luci /tmp" >> /etc/rc.lang
		echo "mount --bind /tmp/luci /usr/lib/lua/luci" >> /etc/rc.lang
		echo "cp /etc/base.*.lmo /usr/lib/lua/luci/i18n" >> /etc/rc.lang	
		echo "}" >> /etc/rc.lang
		echo "sed -i 's/ and features\[\"system\"\]\[\"i18n\"\] == \"1\" //' /usr/lib/lua/luci/view/web/inc/sysinfo.htm" >> /etc/rc.lang
		chmod +x /etc/rc.lang
		sed -i "1s|^|[ -f /etc/rc.lang ] \&\& sh /etc/rc.lang\n|" /etc/rc.local
		chmod +x /etc/rc.local
		uci -q delete luci.languages.ru
		uci -q delete luci.languages.en	
		uci set luci.languages.ru=Русский
		uci set luci.languages.en=English
		uci set luci.main.lang=ru
		uci commit luci
		/etc/rc.lang
	} || {
		mount --bind /tmp/luci /usr/lib/lua/luci
		cp /etc/base.*.lmo /usr/lib/lua/luci/i18n
	}
	fi
	luci-reload & rm -r /tmp/luci-indexcache & luci-reload
fi
