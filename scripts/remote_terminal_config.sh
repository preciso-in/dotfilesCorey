#############################################################################
#############################################################################
#                                                                           #
#   ONLY USE THIS IN EPHEMERAL VM / CONTAINER / POD                         #
#   USING IT IN PRODUCTION MAY INCREASE VULNERABILITY TO ATTACK VECTORS     #
#                                                                           #
#############################################################################

{
  # Install thefuck plugin code
  sudo apt update -y
  sudo apt install python3-dev python3-pip python3-setuptools -y
  pip3 install thefuck --user

  # Install neofetch
  # Get Distro details
  sudo apt install neofetch -y

  # Better ls - Show icons for file/dir types
  sudo apt install lsd -y

  # Install ZSh & OhMyZSh
  sudo apt install zsh -y
  sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Install ZSh-AutoSuggestions & ZSh-Syntax-Highlighting & You-Should-Use
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

  # Edit .zshrc - Add plugins, Change Default Editor, Add spaces to prompt
  sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl you-should-use)/' $HOME/.zshrc
  echo -e "\nexport EDITOR=vi" >>$HOME/.zshrc
  echo -e "\nalias kex='kubectl explain'" >>$HOME/.zshrc
  echo -e "\nkyml() {kubectl explain $1 | egrep '<.*>'}"
  echo -e '\nprecmd() {
  echo -e "\n\n"
}' >>.zshrc

  # Set configuration for vim
  cat <<EOF >.vimrc
"Remap ESC to jk and JK
inoremap jk <ESC>
inoremap JK <ESC>

" Set line numbers to show
set nu
set relativenumber

" Set Cursor to blinking line in insert mode
" Set Cursor to block for Normal mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[0 q"

" Fix delay when changing cursor from Insert to Normal mode and back
set ttimeout
set ttimeoutlen=1
set ttyfast

set tabstop=2
set expandtab
EOF

  # Update yq version
  sudo apt remove yq -y && snap install yq

  # Run ZSh
  zsh
}
