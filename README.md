# Dotfiles



### Resources

https://www.paultman.com/git-for-dotfile-configs/

```
git init --bare $HOME/.dotfiles
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
source .zshrc
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin https://github.com/kaykhan/.dotfiles.git
- dotfiles add, commit, push
```
