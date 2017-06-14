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
                if [ -d lib/arm64-v8a ];then
                    mv lib/arm64-v8a lib/arm64
                fi
                if [ -d lib/armeabi-v7a ];then
                    mv lib/armeabi-v7a lib/arm
                fi
                if [ -d lib/armeabi ];then
                    mv lib/armeabi lib/arm
                fi
        fi
    fi
done
chown -R system:system $target/*
chmod -R 755 $target/*
#rm -rf $src
