# Init
sudo apt-get install curl -y 
sudo apt install gnome-tweaks 

# ZSH
sudo apt install zsh -y

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
nvm install --lts
npm install -g neovim eslint_d npm-check-updates prettier typescript-language-server typescript vscode-langservers-extracted yarn @prisma/language-server serverless vim-language-server
#source ~/.zshrc

# tmux
sudo apt-get install tmux xclip
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # install plugins
tmux && ctrl + b  + (shift + I)

#homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#pyenv
sudo apt update; sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

brew install pyenv

#nvim
brew install neovim
# neovim vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
brew install efm-langserver
python -m pip install --user --upgrade pynvim
sudo apt-get install ripgrep # telescope
sudo apt install fd-find # telescope
# install neovim plugins
