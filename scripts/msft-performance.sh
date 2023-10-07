#! /bin/bash
#
# MSFT performance run script for PnP automation. 
#
# Why can't we have nice things?
#
# Author: Elliot Jones


# Config lines used for making and validating a user modified config 
# file for setting system connection secrets and script behavior. 
declare -g CONFIG_LINES=(\
    "[system]" \
    "platform = \"\"" \
    "" \
    "[results]" \
    "host = \"\"" \
    "username = \"\"" \
    "password = \"\"" \
    "folder_num = \"\"" \
    "" \
    "[benchmarks]" \
    "mlc = true" \
    "hpl = true" \
    "lmbench = true" \
    "spec_gcc8_sfp = true" \
    "spec_gcc8_sir = true" \
    "spec_gcc12_sfp = true" \
    "spec_gcc12_sir = true" \
    "coremark = true" \
    "geekbench5 = true" \
    "geekbench6 = true" \
    "stressng = true" \
    "ptu_turbo = true" \
    "ptu_tdp = true" \
);


for i in ${!CONFIG_LINES[@]}; do
    line="${CONFIG_LINES[$i]}";
    echo "${line}" >> config.conf
done


