platform=$(uname);

if [[ $platform == 'Darwin' ]]; then
  echo "Setting bashrc for darwin";
  # Use a long listing format
  alias ll='ls -la'

  # Show hidden files
  alias l.='ls -d .* --color=auto'

elif [[ $platform == 'Linux' ]]; then
  echo "Setting bashrc for linux";
  # Colorize the ls output
  alias ls='ls --color=auto'

  # Use a long listing format
  alias ll='ls -la'

  # Show hidden files
  alias l.='ls -d .* --color=auto'
fi


# PS1 with git branch
PS1='\[\e[0;32m\]\u\[\e[0m\]\[\e[0m\]:\[\e[0;34m\]\W\[\e[0;32m\]$(__git_ps1 " (%s)")\[\e[0;39m\]\$ '

# Load git-completion
source ~/git-completion.bash

# Load git-prompt
source ~/.git-prompt.sh

# Indicate staged and non-staged changes
GIT_PS1_SHOWDIRTYSTATE=1
