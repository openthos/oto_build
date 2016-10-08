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
		rm -rf $src
	fi
    fi
done
