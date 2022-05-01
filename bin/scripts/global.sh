#!/bin/bash

function title(){
    title_="<------*> $* <*------>"
    #'<------*> SETTING TIME <*------>'
}

end_line='<------------------------->'

function log_start(){
    title ${1}
    echo $title_ >> /var/log/ais.out
    echo $title_ >> /var/log/ais.err
}