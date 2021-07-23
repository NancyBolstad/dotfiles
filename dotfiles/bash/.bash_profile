export LANG=en_US.UTF-8
alias git='LANG=en_US git'

##
## BASIC CONFIGURATION
#   ------------------------------------------------------------
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Show hidden files 
alias l.='ls -d .* --color=auto'

## ports
#   ------------------------------------------------------------
alias check_open_ports="lsof -Pi | grep LISTEN"
alias check_port="lsof -i :8888"
alias check_establish="lsof -i | grep -i estab"


# Watch Network Traffic
#   ------------------------------------------------------------
alias network=" nettop -m route "

# Ethernet Address
alias get_macaddress=' networksetup -getmacaddress Wi-Fi '
# public IP
alias ip='curl -s http://wtfismyip.com/text'
# public IP
alias ip2='curl l2.io/ip'
# header
alias header='curl -I g.cn'
alias validate_json='curl -s "http://feeds.delicious.com/v2/json?count=5" | python -m json.tool | less -R'
# flushDNS:     Flush out the DNS Cache
alias flushDNS='dscacheutil -flushcache'    
# lsock:        Display open sockets
alias lsock='sudo /usr/sbin/lsof -i -P'   
# lsockU:       Display only open UDP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'  
# lsockT:       Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   
# ipInfo0:      Get info on connections for en0
alias ipInfo0='ipconfig getpacket en0'    
 # ipInfo1:      Get info on connections for en1
alias ipInfo1='ipconfig getpacket en1'     
 # openPorts:    All listening connections
alias openPorts='sudo lsof -i | grep LISTEN'   
# showBlocked:  All ipfw rules inc/ blocked IPs
alias showBlocked='sudo ipfw list'                  
alias crazy=" LC_ALL=C tr -c '[:digit:]' ' ' < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR='1;32' grep --color '[^ ]' "
# alias matrix=" yes 'c=(" " "  " "   " 0 1); printf "${c[RANDOM%5]}"' | bash "
alias make_svg=' open http://www.vectorization.org/es.html '

## aliases validate JSON
#   ------------------------------------------------------------
alias JSONValidate=" open https://jsonformatter.curiousconcept.com/ "
alias JSONTools=" open https://jsonformatter.org/ "

## aliases Mock RestAPI (local and remote)
#   ------------------------------------------------------------
alias mockRestAPI1=" open https://jsonplaceholder.com/ " 
alias mockRestAPI2=" open http://www.jsontest.com/ "
alias mockRestAPI3=" open https://www.mocky.io/ "
alias mockRestAPI4=" open https://app.fakejson.com/ "
alias mockRestAPI4=" open http://www.omdbapi.com/ "

## Python Server
#   ------------------------------------------------------------
# run a python server
alias server='python -m SimpleHTTPServer 8888'
# dump to :simple http server to dump request headers
alias dump=" curl -s -H 'X-Something: test' localhost:8888 > /dev/null "


# mongoDB
#   ------------------------------------------------------------
alias mon="mongod --dbpath /Users/{user}/met/data/db --rest"


# add Git Branch Name to Terminal Prompt (Linux/Mac)
#   ------------------------------------------------------------
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'\e[0m'
COLOR_USR=$'\e[38;5;243m'
COLOR_DIR=$'\e[38;5;197m'
COLOR_GIT=$'\e[38;5;39m'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

## fun
#   ------------------------------------------------------------
alias radio=" open https://poolsuite.net/"
# play all music files from the current directory
alias playwave='for i in *.wav; do mplayer "$i"; done'
alias playogg='for i in *.ogg; do mplayer "$i"; done'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'

## fonts/icons components
alias icons=" open http://fortawesome.github.io/Font-Awesome/cheatsheet/ "
alias icons2=" open https://design.google.com/icons/ "

## bash_profile
#   ------------------------------------------------------------
alias edit_profile=" open -e ~/.bash_profile "
alias reload_profile=" source ~/.bash_profile "

# Git branch in prompt.
#   ------------------------------------------------------------
parse_git_branch() {
 while read -r branch; do
     [[ $branch = \** ]] && current_branch=${branch#* }
 done < <(git branch 2>/dev/null)

 [[ $current_branch ]] && printf ' [%s]' "$current_branch"
}

## Modify Bash Prompt, Enable colors, improve ls
#   ------------------------------------------------------------
export PS1="-->\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

## testing libs available status
#   ------------------------------------------------------------
alias testme='          
        uname -a;
        java -version;
            apachectl -v;
        git --version;
        node --version;
        npm --version;
        karma --version;
            phantomjs --version;
        casperjs --version;
            php -v;
        mongo --version; 
        mongod --version;
        mongos --version;
            sass -v;
        protractor --version;
        sw_vers;
        webpack -v;
    '
# LOCAL JSON-Server as a Fake REST API in Frontend Development
# npm install -D json-server
# ------------------------------------------------------------
alias fakeServer=' json-server --watch db.json '


# ONLINE JSON-Server as a Fake REST API in Frontend Development
# npm install -D json-server
#   ------------------------------------------------------------
alias fakeJson=' open-a https://jsonplaceholder.typicode.com '

