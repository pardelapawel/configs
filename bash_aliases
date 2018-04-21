alias bim='vim'
alias v='vim'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias ll='ls -alFh'
alias l='ls -a'

alias grep='grep  --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} --exclude=tags'
alias gril='grep -R -I -l'
alias grin='grep -R -I -n'
alias grili='grep -R -I -l -i'
alias grini='grep -R -I -n -i'

alias mv='mv -i'
alias cp='cp -i'

alias wdiff="wdiff -n -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m'"
alias dwdiff="dwdiff -w $'\033[30;41m' -x $'\033[0m' -y $'\033[30;42m' -z $'\033[0m'"
alias diffy='diff --suppress-common-lines -y -W $(( $(tput cols) - 2 ))'

alias g='git'
alias gt='git status'
alias gitc='git checkout'
alias gdiff='git difftool'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"


alias yt="perl -le 'for(@ARGV){s/&.*$//; print s;(www.youtube.com)(/watch);\1/tv/?vq=hd720#\2;r}'"

alias c="perl -ne '\$a.=\$_;END{chomp(\$a); print \$a}' | xclip -selection clipboard"
#alias rand_gen="cat /dev/urandom | perl -ne 'for(split(//, \$_)){print \$_ if m/[[:graph:]]/}' | fold -w`tput cols`"


alias dateiso='date --iso-8601=date'
alias taked='take $(dateiso)'
alias tempd='take /tmp/$(dateiso)'
alias tmpd=tempd

alias r='ranger'
#alias r='ranger --clean'

alias afshoot='gnome-screenshot -a -f af_screen_$(date '+%FT%H_%M_%S').png'

alias sortc='sort | uniq -c | sort -nk1,1'
