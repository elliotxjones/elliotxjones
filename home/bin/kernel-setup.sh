#! /bin/bash

declare -g base_url=https://vault.centos.org
declare -g yum_requirements=()

initial_setup() {
    #TODO: test if space on drive?
    #TODO: set proxies
    #TODO: add yum powertools repo file and gpg key
}

install_kernel_rpm() {
    uri_list+=($(\
        curl https://vault.centos.org/filelist.gz | gunzip \
        | grep "/Source/SPackages/" \
        | grep -P "kernel*.+.src" \
        | grep $(uname -r).src.rpm \
    ))
    
    rpm_uri=$(echo ${uri_list[0]} | grep -oP "/.*+")
    rpm_url=${base_url}${rpm_uri}
    rpm -i $rpm_url 2>&1 | grep -v 'exist'
}

install_deps() {
    #TODO: add yum requirements to array in script for better 
    #   portability
    for i in $(cat yum_requirements);
    do
        yum install -y --nobest --allowerasing $i
    done
}

#TODO: test all deps are installed?

prep_sources() {
    cd ~/rpmbuild/SPECS
    rpmbuild -bp --target=$(uname -m) kernel.spec
    #TODO: get proper BUILD path
    #TODO: new kernel sources dir as var
    #TODO: tests (separate test function?)
        #TODO: test for errors/missing sources dir
        #TODO: abort on missing config
        #TODO: get config path
        #TODO: check /boot is mounted
    #mv ../BUILD/kernel*/linux*/* /usr/src/kernels/
    #TODO: get proper kernel path
    cp /boot/config-$(uname) /usr/src/kernels/linux-$(uname)/.config
}

set_configs() {
    #TODO: sed replace kernel configs (n => m/y)
}

make_kernel() {
    #TODO: check $CPATH is correct (/usr/include?)
    #TODO: get proper kernel path or get dir as var at build
    cd /usr/src/kernels/linux-$(uname -r)
    make -j 100
    make -j 100 modules_install
    make install
}

test_kernel() {
    #TODO: test for /boot/vmlinux
    #TODO: test for /boot/initramfs
}

update_grub() {
    #TODO: check if grub or grub2
    grub_cfg_list+=($(find /boot -iname grub.cfg))
    if ! [[ ${grub_cfg_list[*]} ]]; then
        #TODO: unexpected (debug) 
        exit 1
    else
        #TODO: Use correct grub version
        #TODO: loop for all configs? (should be 1)
        grub-mkconfig -o ${grub_cfg_list[0]}
    fi
}

main() {
    initial_setup
    install_deps
    install_kernel_rpm
    prep_sources
    set_configs
    make_kernel
    test_kernel
    update_grub
}
