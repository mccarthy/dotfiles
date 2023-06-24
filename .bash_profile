# path
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

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
alias eprofile='bashp'
alias sprofile='sbashp'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs="git status"

#python, this article shows like 10 ways to do this wrong, make sure to pay attention to the pyenv method
#https://opensource.com/article/19/5/python-3-default-mac
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Apache
# as of 8/29/2019, apache wasn't working, i think due to MacOS upgrade.
# Couldn't remember how i fixed last time.  This time uninstalled apache, reinstalled with brew
# Reconfigured apache to use ~/Sites/ as DocumentRoot
# Also needed to re-enable php in httpd.conf (LoadModule, dir_module, files_match, etc
# Followed bits of both of these:
# https://gist.github.com/DragonBe/0faebe58deced34744953e3bf6afbec7
# https://gist.github.com/karlhillx/b2ccb9ea1f30ff59505311e1908c3dc4
# See also ~/Sites/_doc for an older set of changes/methods

# Apache Config (Brew)
alias apachelogdir='cd /private/var/log/apache2'
alias apacheconf='sudo subl /usr/local/etc/httpd/httpd.conf'
alias apacheconfdir='cd /usr/local/etc/httpd'
alias phpconf='sudo subl /private/etc/php.ini.default'
alias docroot='cd ~/Sites/'
alias findconfig='$(ps ax -o comm | grep -m 1 httpd) -V | grep SERVER_CONFIG_FILE'

# Apache Config MacOS Defaults
#alias apachelogdir='cd /private/var/log/apache2'
#alias docroot='cd /Library/WebServer/Documents'
#alias apacheconf='sudo subl /private/etc/apache2/httpd.conf'
#alias apacheconfdir='cd /private/etc/apache2/'
#alias phpconf='sudo subl /private/etc/php.ini.default'
#alias devdir='cd ~/Sites/'

# ansible lamp stack
alias lamp-create='ansible-playbook -i hosts.ini lightsail.yml'
alias lamp-secure='ansible-playbook -i hosts.ini secure.yml'
alias lamp-deploy='ansible-playbook -i hosts.ini deploy.yml'
alias lamp-delete='ansible-playbook -i hosts.ini delete.yml'
alias lamp-ssh='ssh bitnami@`cat ~/Dev/ansible/lightsail-lamp/hosts.ini | grep -v "servers" | cut -d" " -f1`'

# util functions
function isdone() {
	terminal-notifier -message "Done" -title "Terminal"
}

# query the authoritative NS to bypass the local cache which sometimes shows incomplete results
function digger()	{
	dig ANY "$1" +noall +answer @`dig +short SOA $1 | cut -d' ' -f1`
}
