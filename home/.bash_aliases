alias la='ls -AX --color --classify --group-directories-first'
alias lla='ls -lAshLX --color --classify --group-directories-first'
alias les='less -~KMQR-'

alias sba='source ~/.bash_aliases; exec bash'
alias vba='vim ~/.bash_aliases'
alias vsc='vim ~/.ssh/config'

alias gpge='gpg --armour -e'

alias cping='ping -c 2 www.gentoo.org'
alias oprts='sudo netstat -ntupl'

alias sshc='ssh -c aes256-cbc '
alias gba='cat ~/.bash_aliases | grep "alias"'
alias music='vim /mnt/c/Users/joneselx/projects/elliotxjones/notes/music-list.md'
alias c='clear'

alias cpop="CPop"
# alias cpop {{{
CPop() {
    OPT=${1}
    export CP_STASH
    if ! [[ $CP_STASH = "" ]]; then
        if [[ -e ${CP_STASH[-1]} ]]; then
            cp -v "${CP_STASH[-1]}" ./
            echo "Popped ${CP_STASH[-1]}"
            unset CP_STASH[-1]
        else
            echo "${CP_STASH[-1]} moved or missing"
            unset CP_STASH[-1]
        fi
    else
        echo "Stash is empty"
    fi
}
# }}}
alias cstash='CStash'
# alias cstash {{{
CStash() {
    declare opt=${1};
    export CP_STASH
    if [[ $CP_STASH = "" ]]; then
        export CP_STASH=();
    fi

    if [[ $opt = "" ]]; then
        echo "No file or directory specified"
    elif [[ $opt = "-l" ]]; then
        for i in ${CP_STASH[*]};
        do
            echo $i
        done
    elif ! [[ -e $opt ]]; then
        echo "No such file or directory"
    else
        CP_STASH+=("$PWD/$opt");
        echo "stashed $PWD/$opt";
    fi
}
# }}}

# Functions
alias qcd='QuickCD'
# alias `qcd` {{{
QuickCD() {
    declare QDIRS_OPT=${1:-"help"};
    declare -A QDIRS;
    
    QDIRS=(\
        ["notes"]="/mnt/c/Users/joneselx/notes" \
        ["tic"]="/mnt/c/Users/joneselx/OneDrive - Intel Corporation/Desktop/Jones-Farm/CSEA/tickets" \
        ["is"]="/mnt/c/Users/joneselx/OneDrive - Intel Corporation/Izumi-systems" \
        ["tk"]="/mnt/c/Users/joneselx/OneDrive - Intel Corporation/tribal-knowledge" \
        ["d"]="/mnt/c/Users/joneselx/OneDrive - Intel Corporation/Desktop" \
        ["h"]="/mnt/c/Users/joneselx" \
        ["dl"]="/mnt/c/Users/joneselx/Downloads" \
        ["jfn"]="/mnt/c/Users/joneselx/OneDrive - Intel Corporation/Desktop/Jones-Farm/CSEA/notes" \
        ["ia"]="/mnt/c/Users/joneselx/projects/izumi-auto" \
        ["pa"]="/mnt/c/Users/joneselx/projects/perf-auto" \
        ["p"]="/home/elliot/projects" \
        ["trans"]="/mnt/c/Users/joneselx/OneDrive - Intel Corporation/Desktop/transfer" \
    );
    if [ "$QDIRS_OPT" = "-a" ]; then
        echo "        #[\"\"]=\"$PWD\" \\" >> \
            ~/.bash_aliases;
    elif [ "$QDIRS_OPT" = "help" ]; then
        printf "Change directory shortcuts.\n";
        printf "Usage: qcd [option]\n\nQuick CD Dirs:\n";
        
        for i in "${!QDIRS[@]}"
        do
            printf "${i}\t${QDIRS[${i}]}\n";
        done
    
    elif [ "${QDIRS["$QDIRS_OPT"]}" != "" ]; then
        cd "${QDIRS["$QDIRS_OPT"]}";
    
    else
        printf "Invalid option\n";
    fi
    
    unset QDIRS_OPT;
    unset QDIRS;
}
# }}}
alias ghist='GrepHistory'
# alias `ghist` {{{
GrepHistory() {
    history | grep ${1};
};
# }}}
alias passgen='PassGen'
# alias `passgen`{{{
PassGen() {
    declare OPT=${1};
    
    if [ "$OPT" = "-h" ] || [ "$OPT" = "--help" ] || [ "$OPT" = "help" ]; then
        printf "Generates random password and pipes to less.\n";
        printf "Usage: passgen <option>\n";
        printf "\t-h,--help,help\tprint this help and exit\n";
        printf "\t\t<int>\tpassword character length (default 12)\n";
    elif ( test -e "/home/elliot/bin/passgen.py" ); then
        python3 -u ~/bin/passgen.py ${OPT} | less;
    elif ! ( test -e "~/bin/passgen.py" ); then
        printf "E: ~/bin/passgen.py not found, aborting.\n";
    else
        printf "E: Something is broken! Aborting :(\n";
    fi

    unset OPT
}
# }}}
alias tres="TreeLess"
# alias `tres` {{{
TreeLess() {
    if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then
        printf "Usage: tres [dir:-pwd] [depth:-2] [optional tree flag]\n"
        return
    fi
    tree -aFCthR ${3} --dirsfirst --du \
    --filelimit 200 -L ${2:-2} -I ".git|*.swp" ${1:-$pwd} | \
    less -~KMQR-;
};
# }}}
alias lac='ListAllCount'
# alias `lac` {{{
ListAllCount() {
    declare -i TOTAL_COUNT=$(la ${1:-$pwd} | wc -l);
    declare -i FILE_COUNT=$(find ${1:-$pwd} -maxdepth 1 -type f | wc -l);
    # declare -i DIRECTORY_COUNT=$(expr $TOTAL_COUNT - $FILE_COUNT);
    declare -i DIRECTORY_COUNT=$(find ${1:-$pwd} -maxdepth 1 -type d | wc -l);
    echo "$DIRECTORY_COUNT director$(
        if (( DIRECTORY_COUNT != 1 )); then
            echo "ies"
        else
            echo "y"
        fi
    ), $FILE_COUNT file$(
        if (( $FILE_COUNT != 1 )); then
            echo "s"
        fi
    ), $TOTAL_COUNT total";
    unset TOTAL_COUNT;
    unset FILE_COUNT;
    unset DIRECTORY_COUNT;
};
# }}}
alias md2pdf='MarkdownToPDF'
# alias `md2pdf` {{{
MarkdownToPDF() {
        #--css=github-pandoc.css \
        #--css ~/bin/pandoc.css \
        #-f gfm \
    pandoc "$1" \
        -f markdown \
        -V linkcolor:blue \
        -V geometry:a4paper \
        -V geometry:margin=2cm \
        -V mainfont="DejaVu Serif" \
        -V monofont="DejaVu Sans Mono" \
        -V fontsize=11pt \
        --pdf-engine=xelatex \
        --highlight-style ~/bin/custom.theme \
        --include-in-header ~/bin/chapter-break.tex \
        --include-in-header ~/bin/inline-code.tex \
        --include-in-header ~/bin/bullet-list.tex \
        -o "$2"
}
# }}}

alias hints='PrintHints'
# alias `hints` {{{
PrintHints() {
    printf "# Make Fat32 filesystem.\n    sudo mkfs.vfat -F32 [/dev/sdb3]\n";
    printf "# Extract tar.gz.\n    tar -xfv\n";
    printf "# Extract tar.xz.\n    tar -xfv\n";
    printf "# Extract tar.bz2.\n    tar -xjfv\n";
    printf "# Year calendar term dimensions.\n    66x36\n";
    printf "# Write iso image to disk.\n    sudo dd if=path/*.iso of=/dev/sdb bs=4M conv=fdatasync status=progress\n";
    printf "# Scan open ports.\n    sudo netstat -ntlpu [-l=listening,-n=port#,-p=program,-t=tcp,-u=udp]\n";
    printf "# Convert \`.webp\` images to \`.png\`.\n    \`dwebp file.webp -o file.png\`\n"
    printf "# Kill tasks safely.\n    kill -15 [task PID]\n"
};
# }}}

