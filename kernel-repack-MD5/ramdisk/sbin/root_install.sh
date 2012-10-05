#!/sbin/sh

if /sbin/test ! -d /system/xbin; then
	/sbin/mkdir -p /system/xbin
fi

if /sbin/test ! -f /system/xbin/su; then
	/sbin/cp /sbin/su-bin /system/xbin/su
	/sbin/chown 0.0 /system/xbin/su
	/sbin/chmod 6755 /system/xbin/su
else
	/sbin/chown 0.0 /system/xbin/su
	/sbin/chmod 6755 /system/xbin/su
fi

if -f /system/sbin/su; then
	/sbin/rm -Rf /system/sbin/su
fi

if -f /system/bin/su; then
	/sbin/rm -Rf /system/bin/su
fi

if /sbin/test ! -f /system/Superuser.apk || -f /system/Supersu.apk; then
	/sbin/cp /sbin/Superuser.apk /system/app/Superuser.apk
	/sbin/chmod 0644 /system/Superuser.apk
else
	/sbin/chmod 0644 /system/Superuser.apk
fi
