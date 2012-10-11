#!/sbin/busybox sh

bbdir="/system/bin /system/xbin" ; 
ndeletes=0 ; 
for bbpath in $bbdir ; 
	do 
		for f in $(busybox find $bbpath -type l) ; 
			do 
				gnr=$(busybox readlink $f) ; 
				if echo "$gnr" |busybox grep -q busybox ; 
					then 
						busybox echo "$f linking to $gnr . Now deleting" ; 
						busybox rm $f ; 
						ndeletes=`busybox expr $ndeletes + 1` ; 
					else busybox echo "$f is not linked to busybox, but to $gnr ---> file not deleted" ; 
				fi ; 
		done 
done

if /sbin/busybox test -f /system/bin/busybox ; then
	/sbin/busybox rm -Rf /system/bin/busybox
fi

if /sbin/busybox test -f /system/xbin/busybox ; then
	/sbin/busybox rm -Rf /system/xbin/busybox
fi

if /sbin/busybox test ! -d /system/sbin; then
	/sbin/busybox mkdir -p /system/sbin
fi

if /sbin/busybox test ! -f /system/sbin/busybox; then
	/sbin/busybox cp /sbin/busybox /system/sbin/busybox
	/system/sbin/busybox --install -s /system/sbin
fi

if /sbin/busybox test -f /system/sbin/su; then
	/sbin/busybox rm -Rf /system/sbin/su
fi

if /sbin/busybox test -f /system/bin/su; then
	/sbin/busybox rm -Rf /system/bin/su
fi

if /sbin/busybox test ! -d /system/xbin; then
	/sbin/busybox mkdir -p /system/xbin
fi

if /sbin/busybox test ! -f /system/xbin/su; then
	/sbin/busybox cp /sbin/su-bin /system/xbin/su
	/sbin/busybox chown 0.0 /system/xbin/su
	/sbin/busybox chmod 6755 /system/xbin/su
else
	/sbin/busybox chown 0.0 /system/xbin/su
	/sbin/busybox chmod 6755 /system/xbin/su
fi
