#! /bin/bash

# make_config
make_config() {
    declare config_path=$1;

    ! [[ -f $config_path ]] || rm $config_path;

    # Config lines used for making and validating a user modified 
    # config file. 
    declare config_lines=(\
        "[secrets]" \
        "host = \"1.2.3.4\"" \
        "username = \"user\"" \
        "password = \"itsasecret\"" \
        "" \
        "[options]" \
        "# Set to true or false" \
        "option1 = true" \
        "option2 = false" \
        "option3 = true" \
    );
        
    for i in ${!config_lines[@]}; do
        declare line=${config_lines[$i]};
        echo "${line}" >> $config_file;
    done
}
# parse_config
parse_config() {
    declare config_path=$1;
    declare -gA CONFIG=();
    # Filter out comments so they aren't interpreted.
    declare lines=$(grep -oP ^"[^#].+" $config_path);
    # Match everything between `[` and `]` as table headers.
    declare headers=$(echo $lines | grep -oP "(?<=\[)\S+?(?=\])");
    for h in ${headers[*]}; do
        # Use headers to match individual tables.
        declare table=$(echo $lines | grep -oP "\[$h(\n|.)+?(?=(\[|\Z))");
        # Match strings on the left of `=` sign as variables.
        declare keys=($(echo $table | grep -oP "\S+\s?(?=\=)"));
        for i in $(seq ${#keys[@]}); do
            declare key=${keys[$((i-1))]};
            # 1. Use variable keys to match everything up to the next 
            #    variable key as the variable value.
            # 2. Match everything to the right of the `=` sign.
            # 3. Remove leading/trailing whitespace.
            declare val=$(\
                echo $table | \
                grep -oP "(?<=${key}).+(?=${keys[$i]})" | \
                grep -oP "(?<=\=).+" | \
                grep -oP "\S(.+|\s)\S" \
            );

            if ! [[ $val ]]; then
                # Don't save undefined variables.
                continue;
            elif [[ ${CONFIG[$h]} ]]; then
                # Append key if key list is not empty.
                CONFIG[$h]+=" ${key}";
            else
                # Write key list with first key.
                CONFIG[$h]=$key;
            fi
            
            # Define `header.key=value` keypairs.
            CONFIG["${h}.${key}"]=$val;
        done
    done
}

main() {
    declare script_path=$(dirname "$0");
    declare config_file="${script_path}/config.toml"

    if  [[ -f $config_file ]]; then
        parse_config $config_file;
    else
        echo "$config_file: No such file.";
        make_config $config_file;
        echo "Created template $config_file";
        echo "Edit before re-running script!";
        exit 1;
    fi

    for key in ${CONFIG["secrets"]}; do
        val=${CONFIG["secrets.${key}"]};
        echo "$key is $val";
    done
    for key in ${CONFIG["options"]}; do
        declare -l val=${CONFIG["options.${key}"]};
        if [[ $val == "true" ]]; then
            echo "$key is enabled";
        else
            echo "$key is disabled";
        fi
    done

}

main
