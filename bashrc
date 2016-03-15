platform=$(uname);

if [[ $platform == 'Darwin' ]]; then
  # Use a long listing format
  alias ll='ls -la'

  # Show hidden files
  alias l.='ls -d .* --color=auto'

  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad

elif [[ $platform == 'Linux' ]]; then
  # Colorize the ls output
  alias ls='ls --color=auto'

  # Use a long listing format
  alias ll='ls -la'

  # Show hidden files
  alias l.='ls -d .* --color=auto'
fi


# PS1 with git branch
PS1='\[\e[0;32m\]\u\[\e[0m\]\[\e[0m\]:\[\e[1;34m\]\W\[\e[0;32m\]$(__git_ps1 " (%s)")\[\e[0;39m\]\$ '

# Load git-completion
source ~/git-completion.bash

# Load git-prompt
source ~/.git-prompt.sh

# Indicate staged and non-staged changes
GIT_PS1_SHOWDIRTYSTATE=1

# Check Internet connection
alias pingg="ping -s 0 8.8.8.8"

# Show size of file or dir
alias sizeof="du -h"

# Show system storage info
alias space="df -h"

# tmux(Screen) aliases
alias mv+="tmux swap-window -t +1" # move window to right
alias mv-="tmux swap-window -t -1" # move window to left

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Source nvm bash completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

nvm alias default 5 &> /dev/null

# rvm setup
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

rvm use 2 --default &> /dev/null
