alias vim="nvim"

alias logout="sh ~/Documents/scripts/logout.sh"

alias intel_brew="/usr/local/Homebrew/bin/brew"

alias lg="lazygit"
alias lc="lazycli"
alias gcm="git checkout master; git pull"
alias gp="git pull"
alias gm="git fetch; git merge origin/master"
alias gP="git push -u origin"

alias pa="cd ~/dev/riemann/app/native/ios && arch -x86_64 bundle exec pod install && cd -"
alias pt="cd ~/dev/riemann/trade/native/ios && pod install && cd -"

alias ass="cd /Users/aran/dev/riemann/app/native/ios && cp -r _assets assets && cd -"
alias squash="git reset (git merge-base master (git rev-parse --abbrev-ref HEAD))"

alias home="cd ~/"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias dev="cd ~/dev"
alias root="cd ~/dev/riemann"
alias core="cd ~/dev/riemann/core"
alias app="cd ~/dev/riemann/app/native"
alias web="cd ~/dev/riemann/app/web"
alias trade="cd ~/dev/riemann/trade/native"
alias story="cd ~/dev/riemann/core/storybook-docs"
alias mocks="cd ~/dev/riemann/app/mocks"

alias ..="cd .."
alias ls="ls -laG"

alias gg="ddgr"

alias android="emulator @Pixel_4_API_29 >/dev/null 2>&1 &"
alias f="find . | grep -i"

alias nuke="rm yarn.lock; find . -name "node_modules" -exec rm -rf '{}' +;"
alias remote="git branch --set-upstream-to=origin/(git symbolic-ref --short HEAD)"

alias login="sh ~/Documents/scripts/login.sh"

nvm alias arm 16.14.2 > /dev/null /dev/null 2>&1
nvm alias intel 16.8.0 > /dev/null /dev/null 2>&1
