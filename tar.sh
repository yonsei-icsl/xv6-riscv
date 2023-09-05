#!/bin/bash

#########################################################
# EEE3535 Operating Systems                             #
# Written by William J. Song                            #
# School of Electrical Engineering, Yonsei University   #
#########################################################

dir=xv6-riscv
if [[ `basename $PWD` == $dir ]]; then
    sid=$(grep -w sid user/sid.h | cut -d' ' -f3)

    if [[ $sid == 1234567890 ]]; then
        read -p "Enter your 10-digit student ID: " sid
        read -p "Enter your name in English: " sname
        echo ""
        echo "#define sid $sid" > user/sid.h;
        echo "#define sname \"$sname\"" >> user/sid.h;
    fi

    make clean > /dev/null;
    rm -f $sid.tar;
    cd ..;
    tar cf $sid.tar xv6-riscv;
    mv $sid.tar xv6-riscv/;
else
    echo "Error: $0 must run in the $dir/ directory"
fi

