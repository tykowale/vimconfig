# echo is like puts for bash (bash is the program running in your terminal)
# echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"

# $VARIABLE will render before the rest of the command is executed
echo "Logged in as $USER at $(hostname)"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# load Node Version Manager
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 0.12

# rbenv version
eval "$(rbenv init -)"
# Path changes are made non-destructive with PATH=new_path;$PATH   This is like A=A+B so we preserve the old path

# Path order matters, putting /usr/local/bin: before $PATH
# ensures brew programs will be seen and used before another program
# of the same name is called

# Tomcat settings
export CATALINA_HOME=/usr/local/Cellar/tomcat/8.0.30/libexec

# Path for brew
test -d /usr/local/bin && export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/Users/tkowalewski/.rbenv/shims:/Users/tkowalewski/.nvm/versions/node/v0.12.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Library/Tomcat/bin

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# A more colorful git prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# determines if the git branch you are on is clean or dirty
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Useful aliases
alias dl="git pull origin develop"
alias home="git co develop"
alias e="wstorm ."
alias j="ij ."
alias yolo="rm -rf node_modules/ && rm -rf bower_components/ && npm install && bower install"
alias core="rm -rf bower_components/up-ui-core/src && rm -rf node_modules/up-ui-core && mkdir bower_components node_modules && cp -r ~/Uptake/frontend/up-ui-core/src bower_components/up-ui-core/ && cp -r ~/Uptake/frontend/up-ui-core node_modules/up-ui-core/"
alias report="open .stats/coverage/coverage/index.html"
alias pr='git push origin $1 2>&1 | tee >(grep -e https | sed "s/remote:   //g" | pbcopy)'

