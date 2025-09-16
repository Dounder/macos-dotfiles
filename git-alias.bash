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
