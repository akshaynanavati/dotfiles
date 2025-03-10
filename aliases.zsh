alias kd='killall Dock'
alias kc='killall ControlStrip'

grepr() {
  if [ "$#" -eq 1 ]; then
    grep -r $1 .;
  elif [ "$#" -eq 2 ]; then
    grep -r $1 $2;
  elif [ "$#" -ge 2 ]; then
    grep -r "${@:3}" $1 $2;
  else
    echo 'Usage: grepr <search-string>[ <dir>[ <additional args>]]'
  fi
}

getpids() { ps aux | grep $1 | awk '{ print $2 }'; }
killregex() { kill -9 `getpids $1`; }
mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
remove_dups() { nl $1 | sort -k2 -k 1,1nr | uniq -f1 | sort -n | cut -f2; }
space_to_newline() { echo "$1" | sed -e 's/\s\+/\n/g'; }
echoerr() { echo "$@" 1>&2; }

# git aliases
alias gashp='git stash pop'
alias gbr='g branch'
alias gcob='git checkout -b'
alias glg='git log --graph'
alias gln='git log --stat --graph'
alias glno='git log --name-only'
alias gr='git reset --'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias grv='git remote -v'
alias grhm='git fetch && git reset --hard origin/master'
gnf () { gcob $1 && git fetch && git reset --hard origin/master; }
gcpl () { gco $1 && git pull; }
alias gdh='git diff HEAD^'
alias gfc='git diff --name-only'
alias gfch='git diff HEAD^ --name-only'
alias gcma='git add --all && git commit --amend --no-edit'
alias gcu='git commit -m Update'
alias gcua='git add --all && git commit -m Update'
alias gpl='git pull --recurse-submodules'
alias gup='br=$(git branch --show-current); git branch --set-upstream-to=origin/$br $br'

grho () { git checkout $1 && git fetch && git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); }
grpl () { git checkout $1 && git fetch && git rebase origin/master; }

alias gopen='vim $(git diff HEAD^ --name-only)'

gbrd() {
    branches=("$@");
    for branch in "${branches[@]}"
    do
        git branch -D "$branch";
        git push origin --delete "$branch";
    done
}

unalias gca
gca() {
    if [[ -z "${1// }" ]]; then
        echo "Error: The first argument is empty or all spaces."
        return 1
    fi
    git add --all;
    git commit -am "$1";
}

retry() {
  until "$@"; do true; done
}

alias dev_et="et dev-akshayn -c 'tmux -CC attach-session -dt main || tmux -CC new-session -s main'"
