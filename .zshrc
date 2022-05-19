echo "loaded .zshrc"
## Env
#Lang

## 補完設定
autoload -U compinit
compinit
function chpwd() { ls }

## cdなんて不要
setopt auto_cd

## push補完
setopt auto_pushd

## 間違いに優しく
setopt correct

## history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## Prompt
autoload colors
colors

case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %{${fg[red]}%}%n@%m%#%{${reset_color}%} "
    PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    RPROMPT="%{${fg[green]}%}[%~:%T]%{${reset_color}%}"
    ;;
*)
    PROMPT="%{${fg[blue]}%}%n@%m%%%{${reset_color}%} "
    PROMPT2="%{${fg[blue]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    RPROMPT="%{${fg[green]}%}[%~:%T]%{${reset_color}%}"
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

alias ll="ls -la"
alias lgtm="f=\$(ls /opt/homebrew/Cellar/figlet/2.2.5/share/figlet/fonts/*.flf | shuf -n1) && basename \$f .flf && echo -n -e '\n' && figlet -f \$f -w 400 LGTM | tee >(pbcopy)"

## export PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$PATH:$HOME/dotfiles/scripts
