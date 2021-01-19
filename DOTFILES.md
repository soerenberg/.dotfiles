# Dotfiles

Based on https://www.atlassian.com/git/tutorials/dotfiles


### Install on new system


Should be in `.zshr`

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'
```

Avoid weird recursion

```bash
echo ".cfg" >> .gitignore
```

```bash
git clone --bare git@github.com:soerenberg/.dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

If checkout fails, create backup

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

```bash
config config --local status.showUntrackedFiles no
```


### Starting from scratch

```bash
git init --bare $HOME/.cfg-git
alias config='/usr/bin/git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'" >> $HOME/.bashrc
```
