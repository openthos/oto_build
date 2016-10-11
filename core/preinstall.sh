#!/system/bin/sh
src=/data/vendor/app/
target=/data/app/
if [ ! -d /data/vendor/app ];then
    return
fi
if [ ! -d /data/app ];then
    mkdir /data/app
fi
for dir in `ls $src`
do
    if [ -n $src/$dir ];then
        if [ -e $src/$dir/"$dir".apk ];then
        	mv $src/$dir $target
			cd $target/$dir
			mv "$dir".apk base.apk
			unzip base.apk lib*
	fi
    fi
done
chown -R system:system $target/*
chmod -R 755 $target/*
#rm -rf $src
