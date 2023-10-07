#! /bin/bash

declare -A CONFIG=();

main() {
    declare input=$1;

    declare lines=$(grep -oP ^"[^#].+" $input);
    declare headers=$(echo $lines | grep -oP "(?<=\[)\S+?(?=\])");
    for h in ${headers[*]}; do
        declare table=$(echo $lines | grep -oP "\[$h(\n|.)+?(?=(\[|\Z))");
        declare keys=($(echo $table | grep -oP "(\w|\.)+\s?(?=\=)"));
        for i in $(seq ${#keys[@]}); do
            declare key=${keys[$((i-1))]};
            declare value=$(\
                echo $table | \
                grep -oP "(?<=${key}).+(?=${keys[$i]})" | \
                grep -oP "(?<=\=).+" | \
                grep -oP "\S(.+|\s)\S" \
            );
            if [[ ${CONFIG[$h]} ]] && [[ $value ]]; then
                CONFIG[$h]+=" ${key}";
                CONFIG["${h}.${key}"]=$value;
            elif ! [[ ${CONFIG[$h]} ]] && [[ $value ]]; then
                CONFIG[$h]=$key;
                CONFIG["${h}.${key}"]=$value;
            fi
        done
    done

    for key in ${CONFIG["results"]}; do
        value=${CONFIG["results.${key}"]}
        echo "$key=$value"
    done
}

main $1;

