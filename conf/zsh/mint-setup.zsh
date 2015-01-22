export GIT_EDITOR=emacs
export BUNDLER_EDITOR=emacs

alias be='bundle exec'
alias bec='bundle exec cucumber'
alias becw='bundle exec cucumber --tags @wip'
alias ber='bundle exec rake'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff --color --word-diff'
alias gl='git log --decorate'
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gsp='git stash pop'
alias gss='git stash save'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

echo
fortune