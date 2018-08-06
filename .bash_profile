#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# path
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
#export PATH="/usr/local/Cellar/p7zip/9.20.1/bin:$PATH"
export PATH="/Users/mccarthy/Library/Python/2.7/bin:$PATH"

# terminal prompt and color
export CLICOLOR=1
export PS1="\u@\h\w $ "

# use sublime as default editor, but not for visudo editor because that causes issues
# http://apple.stackexchange.com/questions/130171/using-visudo-to-edit-sudoers-on-mac
export EDITOR='subl_wait.sh'
alias visudo='EDITOR=vi sudo visudo'

# Eternal bash history
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# utility aliases
alias defaultgateway='route -n get default'
alias countdistinct='sort | uniq -c | sort -nr'
alias fixaudio='sudo killall coreaudiod'
alias notifyme='isdone'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias remextendedattr='xattr -c'
alias bashp='subl ~/.bash_profile'
alias sbashp='source ~/.bash_profile'

# web dev
alias apachelogdir='cd /private/var/log/apache2'
alias docroot='cd /Library/WebServer/Documents'
alias apacheconf='sudo subl /private/etc/apache2/httpd.conf'
alias apacheconfdir='cd /private/etc/apache2/'
alias phpconf='sudo subl /private/etc/php.ini.default'
alias devdir='cd ~/Sites/'

# util functions
function isdone() {
	terminal-notifier -message "Done" -title "Terminal"
}

# query the authoritative NS to bypass the local cache which sometimes shows incomplete results
function digger()	{
	dig ANY "$1" +noall +answer @`dig +short SOA $1 | cut -d' ' -f1`
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
