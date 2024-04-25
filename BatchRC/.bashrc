USER=
PROJ_PATH=
IP=
FILE_PATH=
REL_PATH=


PATH=$PATH:/C/Users/$USER/AppData/Roaming/Python/Python311/Scripts

alias cdp='cd /$PRJ_PATH;pwd'
alias cdk='cd /$PRJ_PATH/mcu-sdk;pwd'

alias python='winpty python.exe'
alias python3='winpty python3.exe'

alias format-files='$(git rev-parse --show-toplevel)/$REL_PATH/format-files.py'

alias upload-file='func(){ cp "$1" "//$IP/$FILE_PATH/";}; func'
alias download-file='func(){ cp "//$IP/$FILE_PATH/$(basename "$1")" "$1";}; func'
