# git log pretty
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# git status
git config --global alias.s 'status -sb'
# Git log --oneline
git config --global alias.ll 'log --oneline'
# Git last commit
git config --global alias.last 'log -1 HEAD --stat'
# Git diff
git config --global alias.d 'diff'
git config --global alias.dv 'difftool -t vimdiff -y'
# Additional Git aliases
git config --global alias.gs 'status'
git config --global alias.ga 'add'
git config --global alias.gaa 'add .'
git config --global alias.gc 'commit'
git config --global alias.gcm 'commit -m'
git config --global alias.gp 'push'
git config --global alias.gpp 'pull'
git config --global alias.gpo 'push origin'
git config --global alias.gpom 'push origin main'
git config --global alias.gco 'checkout'
git config --global alias.gcb 'checkout -b'
git config --global alias.gb 'branch'
git config --global alias.gbd 'branch -d'
git config --global alias.gm 'merge'
git config --global alias.gl 'log --oneline'
git config --global alias.gd 'diff'
git config --global alias.gds 'diff --staged'
