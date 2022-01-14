### Alias for git 
alias gco="git checkout "

# If you are force pushing ALWAYS force push with lease
# https://developer.atlassian.com/blog/2015/04/force-with-lease/
alias gfpwl="git push --force-with-lease"

# pretty tree graph of branches
alias gl="git log --graph --decorate --pretty=oneline --abbrev-commit"

# stage hunks
alias gah="git add --patch"

# and and stash stuff to clear repo
alias gs="git add . && git stash"

# diff wit not plus and minus in front - good for copying old chunks
alias gd='git diff --color-words'

# sometimes just need to add all and ammend
alias gam="git add . && git commit --amend"

# set remote branch to local branch
alias gsb=__gsb

function __gsb {
  git branch --set-upstream-to=origin/`git rev-parse --abbrev-ref HEAD` `git rev-parse --abbrev-ref HEAD`
}

# Quick server
alias server="python -m SimpleHTTPServer 8001"

# List ssh hosts
alias hosts="cat ~/.ssh/config | grep 'Host '"

# we usually prefeix commit messages with the branch name.  This does that.
alias gcm=__gcm

function __gcm {
 BRANCH_NAME=`git branch | grep \* | sed -E "s/(\* )(.+)/\2/g"`
 git commit -m "$BRANCH_NAME: $1"
}

# Pretty tree for git log
alias lg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ce %cr)" --abbrev-commit --date=relative'

# Quick way to check ip address
alias ip="ifconfig | grep -oEi 'inet\s(.*)\snetmask.*broadcast' | cut -d ' '  -f2"

## Not an alias but sets vim config - TODO put in seperate env variable file for inclusion'
export VISUAL=nvim
export EDITOR="$VISUAL"

# make sure vim doesn't hang on ctl s : https://unix.stackexchange.com/a/72092
stty -ixon

HISTCONTROL=ignorespace

alias vim=/usr/local/bin/vim
alias v=nvim
alias refresh='source ~/.bashrc'

new_tmux_session() {
  tmux new -s "$1"
}

alias tn=new_tmux_session

attach_tmux_session() {
  tmux attach -t "$1"
}

alias ta=attach_tmux_session

list_tmux_sessions() {
  tmux ls
}

alias tl=list_tmux_sessions

show_help() {
  echo "
  ctrl-a      - move the cursor to the beginning of the current line
  ctrl-e      - move the cursor to the end of the current line
  alt-b       - move the cursor backwards one word
  alt-f       - move the cursor forward one word
  ctrl-k      - delete from cursor to the end of the line
  ctrl-u      - delete from cursor to the beginning of the line
  alt-d       - delete the word in front of the cursor
  ctrl-w      - delete the word behind of the cursor

  pbcopy      - copy to clipboard
  pbpaste     - paste from clipboard
  cd -        - change into most recently accessed directory
  pushd <dir> - add current directory to stack & move
  popd <dir>  - move to top directory in stack

  ctrl-z      - stops current job
  fg          - moves most recent job to foreground
  bg          - moves most recent job to background
  disown -h   - detach process from shell
  jobs -l     - lists jobs
  "
}

alias hint=show_help

git_hint() {
  echo "
  git pull origin master --rebase                                                   - whilst on you're on your feature branch
  git reset --hard origin/[branch]                                                  - reset branch after someone else has git push -f
  git fetch -p && git branch -vv | awk '/: gone]/{print \$1}' | xargs git branch -D - remove local branches that are deleted on remote
  git commit -a --amend -C head
  "
}

alias git_hint=git_hint

it_log() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --abbrev-commit
}

alias gl=git_log

alias prettyjson='python -m json.tool'

alias lein_what=lein_what

lein_what() {
  echo "
  ancient      - A Leiningen plugin to check your project for outdated dependencies and plugins.
  eastwood     - Eastwood is a Clojure lint tool that uses the tools.analyzer and tools.analyzer.jvm libraries to inspect namespaces and report possible problems.
  kibit        - kibit is a static code analyzer for Clojure, ClojureScript, cljx and other Clojure variants.
  bikeshed     - A Leiningen plugin designed to tell you your code is bad, and that you should feel bad.
  deps-tree    - Prints a nicely formatted tree of all project dependencies
  cljfmt check - A tool for formatting Clojure code
  yagni        - Yagni is a static code analyzer that helps you find unused code in your applications and libraries.
  "
}

plugins=(
  git
)
