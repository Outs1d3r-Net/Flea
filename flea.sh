#!/bin/bash

if [ "$1" == "" ];then
    printf '
 .    *     *`
. . .   .  ,
.  *      .
'
    echo -e "\t\t~Flea v1.0.0\n\nUsage: bash $0 target 200 /tmp/wordlist.txt";
    exit 0;
fi

echo -e "Start Flea v1.0.0 Running...\nSeT tHe TaRgEt: \033[1;31m$1\033[0m\n\n";

for path in $(cat $3);do
    httpcode=$(curl -s -o /dev/null -w "%{http_code}"\
        -H "User-Agent: Flea/v1.0.0 (compatible; Flea; http://github.com/Outs1d3r-Net/Flea)"\
            https://$1/$path -k);


    if [ $httpcode -eq $2 ];then
        echo -e "Path: \033[0;36mhttps://$1/$path\033[0m \033[1;32m[*] Found !\033[0m";
    else
        echo -e "Not found: $path ==> \033[1;31m$httpcode\033[0m";
    fi

    sleep 5; # Bypass Ratelimit/WAF

done

exit 0;
