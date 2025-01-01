#!/bin/bash

function lf_rm() {
    for file in "$@"; do
        if [ -e "$file" ]; then
            echo "Deleting: $file"
            rm -rf "$file"  
        #else
            #echo "File not found: $file" 
        fi
    done
}

# remove unused files
function remove_data()
{
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/*.aiisp
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/*.data
    
    # drm
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libdrm*
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libdrm_rockchip*

    # kms
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libkms*

    # freetype
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libfreetype*

    # iconv
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libiconv*

    # rkAVS
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/librkAVS*
    
    # jpeg
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libjpeg*

    # png
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/libpng*

    # vqefiles
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/share/vqefiles/*

    # remove iqfiles and link in /etc
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/share/iqfiles/*
    rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/iqfiles

    # Samba files
    lf_rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/samba/*

    # bin files
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/bin/*

    # RkEnv.sh & S21appinit

    rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/profile.d/RkEnv.sh
    rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/S21appinit


    # libs
    mkdir -p $RK_PROJECT_PACKAGE_ROOTFS_DIR/lib/modules/5.10.160/

    mv $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/* $RK_PROJECT_PACKAGE_ROOTFS_DIR/lib/modules/5.10.160/

    # restore protoc and its lib

    cp $RK_BUILDROOT_PATH/output/staging/usr/bin/protoc $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/
    cp -a $RK_BUILDROOT_PATH/output/staging/usr/lib/libprotoc.so* $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/lib/



    # ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/phy-rockchip-csi2-dphy-hw.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/phy-rockchip-csi2-dphy.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rga3.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rknpu.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rockit.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc3336.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/video_rkcif.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/video_rkisp.ko
    lf_rm $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/mpp_vcodec.ko
    
}

#=========================
# run
#=========================
remove_data