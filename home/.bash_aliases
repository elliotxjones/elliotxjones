alias la='ls -AX --color --classify --group-directories-first'
alias lla='ls -lAshLX --color --classify --group-directories-first'
alias les='less -~KMQR-'

alias sba='source ~/.bash_aliases; exec bash'
alias vba='vim ~/.bash_aliases'
alias vbas='vim ~/bin/bash_alias_scripts.sh'
alias vsc='vim ~/.ssh/config'
alias vkh='vim ~/.ssh/known_hosts'

alias gpge='gpg --armour -e'

alias cping='ping -c 2 www.gentoo.org'
alias oprts='sudo netstat -ntupl'

alias c='clear'


# Functions
alias qcd='QuickCD'
alias passgen='PassGen'
alias tres="TreeLess"
alias lac='ListAllCount'
alias ghist='GrepHistory'
alias hints='PrintHints'

alias lo='sudo cryptsetup luksOpen'
alias lo='LuksOpen'
alias md2pdf='MarkdownToPDF'
alias md2html='MarkdownToHTML'

alias sshc='ssh -c aes256-cbc '
alias gba='cat ~/.bash_aliases | grep "alias"'
alias creds='vim /mnt/c/Users/joneselx/OneDrive\ -\ Intel\ Corporation/Desktop/Jones-Farm/CSEA/notes/creds.txt'
alias music='vim /mnt/c/Users/joneselx/projects/elliotxjones/notes/music-list.md'

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
# alias `lo` {{{
LuksOpen() {
    declare LUKS_PART=${1:-"help"};

    if [ "$LUKS_PART" = "help" ]; then
        printf "Decryptes and mounts luks encrypted device partitions.\n";
        printf "Usage: lo [luks partition]\n";
    elif ( test -b "/dev/${LUKS_PART}" ); then
        if ( test -f "/dev/mapper/${LUKS_PART}" ); then
            sudo cryptsetup luksClose /dev/mapper/${LUKS_PART};
        fi
        sudo cryptsetup luksOpen /dev/${LUKS_PART} ${LUKS_PART};
        sudo mkdir -p /media/$(whoami)/${LUKS_PART};
        sudo mount /dev/mapper/${LUKS_PART} /media/$(whoami)/${LUKS_PART};
        cd /media/$(whoami)/${LUKS_PART};
        thunar /media/$(whoami)/${LUKS_PART};
    elif ! ( test -b "/dev/${LUKS_PART}" ); then
        printf "E: /dev/${LUKS_PART} does not exist, aborting.\n"
    else
        printf "E: Invalid operation, aborting.\n";
    fi
}
# }}}
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
# alias `ghist` {{{
GrepHistory() {
    history | grep ${1};
};
# }}}
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
#
# FUN
# nc -4 -d -z -w 1 10.45.244.41 22 &> /de
# v/null
#
# if [[ $? == 0 ]]; then     echo "online
# "; else     echo "offline"; fi
