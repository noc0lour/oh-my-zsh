# Author: 
# - Andrej Rode <mail@andrejro.de>

if [[ -e $( which -p eix 2>&1 ) ]]; then
    sync_pref='eix-sync'
else
    sync_pref='emerge --sync'
fi
port_pref='emerge'

# Check if sudo is there and use it

if [[ -e $( which -p sudo 2>&1 ) ]]; then
    use_sudo=1
fi

# Aliases ###################################################################


# superuser operations ######################################################
if [[ $use_sudo -eq 1 ]]; then
    alias euw='sudo $port_pref -UuD --with-bdeps=y @world'
    alias es='sudo $sync_pref'
    alias edc='sudo $port_pref --depclean'
    if [[ -e $( which -p revdep-rebuild 2>&1 ) ]]; then
        alias err='sudo revdep-rebuild'
    fi
else
    alias euw="su -lc \'$port_pref -UuD --with-bdeps=y @world\' root"
    alias es="su -lc \'$sync_pref\' root"
    alias edc="su -lc \'$port_pref --depclean\' root"
    if [[ -e $( which -p revdep-rebuild 2>&1 ) ]]; then
        alias err="su -lc \'revdep-rebuild\' root"
    fi
fi
