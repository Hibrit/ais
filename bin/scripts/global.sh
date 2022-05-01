#!/bin/bash

source /etc/bash.bashrc

function title(){
    title_="<------*> $* <*------> ($(/usr/bin/date +%s))"
    #'<------*> SETTING TIME <*------>'
}

function log_start(){
    title ${1}
    echo $title_ >> /var/log/ais.out
    echo $title_ >> /var/log/ais.err
}