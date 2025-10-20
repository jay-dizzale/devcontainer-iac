HISTFILE=/home/ubuntu/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
unsetopt HIST_SAVE_BY_COPY

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST

alias ll='ls -lah'

## CUSTOM FUNCTIONS
function gitpush() {
  git add .
  git commit -m "${1}"
  git push origin 
}

git config --global init.defaultBranch main
git config --global user.email "5518783+jay-dizzale@users.noreply.github.com"
git config --global user.name "Jay-Dizzale"


# Set Global Editor
git config --global core.editor vim
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.grep auto

# Automatically configure based on .opentofu-version file
export TENV_AUTO_INSTALL=true

PROMPT='%F{red}$(hostname -I)%f- %F{yellow}$(hostname)%f - %F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f 
$ '

export AWS_REGION="eu-central-1"
export PATH=~/kafka/bin:$PATH
export PATH=~/maven/bin:$PATH
