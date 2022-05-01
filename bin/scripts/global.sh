#!/bin/bash

function title(){
    title_="<------*> ${1} <*------>"
    #'<------*> SETTING TIME <*------>'
}

end_line='<------------------------->'

function log_start(){
    title ${1}
    echo $title_ >> /var/log/ais.out
    echo $title_ >> /var/log/ais.err
}

function log_end(){
    echo $end_line >> /var/log/ais.out
    echo $end_line >> /var/log/ais.err
}