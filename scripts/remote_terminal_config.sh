#############################################################################
#############################################################################
#                                                                           #
#   ONLY USE THIS IN EPHEMERAL VM / CONTAINER / POD                         #
#   USING IT IN PRODUCTION MAY INCREASE VULNERABILITY TO ATTACK VECTORS     #
#                                                                           #
#############################################################################

{
  # Set configuration for vim
  echo -e '\n\nConfiguring Vim'
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

  # Get ArgoCD admin password
  # For use in killercoda argocd scenarios
  alias argosec="kubectl get secret -n argocd argocd-initial-admin-secret -o json | jq -r '.data.password' | base64 -d; echo"

  # Install thefuck plugin code
  echo -e '\n\nInstalling thefuck - 1/6'
  echo -e 'Pending Installs - neofetch, lsd, Tree, ZSh & OhMyZSh'
  sudo apt update
  sudo apt install python3-dev python3-pip python3-setuptools -y
  pip3 install thefuck --user

  # Install neofetch
  # Get Distro details
  echo -e '\n\nInstalling neofetch - 2/6'
  echo -e 'Pending Installs - lsd, Tree, ZSh & OhMyZSh'
  sudo apt install neofetch -y

  # Better ls - Show icons for file/dir types
  echo -e '\n\nInstalling lsd - 3/6'
  echo -e 'Pending Installs - Tree, ZSh & OhMyZSh'
  snap install lsd

  # Installing tree command for bash
  echo -e '\n\nInstalling tree - 4/6'
  echo -e 'Pending Installs ZSh & OhMyZSh'
  snap install tree

  # Install ZSh & OhMyZSh
  echo -e '\n\nInstalling ZSh & OhMyZSh - 5/6'
  sudo apt install zsh -y
  sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Install ZSh-AutoSuggestions & ZSh-Syntax-Highlighting & You-Should-Use
  echo -e '\n\nInstalling Auto-suggestions, syntax-highlighting & YouShouldUse - 6/6'
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

  # Edit .zshrc - Add plugins, Change Default Editor, Add spaces to prompt
  echo -e '\n\nAdding plugins and entries to .zshrc'
  sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl you-should-use)/' $HOME/.zshrc
  echo -e "\nexport EDITOR=vi" >>$HOME/.zshrc
  export PATH=$PATH:/root/.local/bin
  eval $(thefuck --alias)

  echo -e '\n\nCreating Alias'
  echo -e "\nalias kex='kubectl explain'" >>$HOME/.zshrc

  echo -e "\nalias kcrns='kubectl create namespace' " >>$HOME/.zshrc
  echo -e "\nalias kgns='kubectl get namespace' " >>$HOME/.zshrc
  echo -e "\nalias kgpv='kubectl get pv' " >>$HOME/.zshrc
  echo -e "\nalias kdpv='kubectl describe pv' " >>$HOME/.zshrc
  echo -e "\nalias kdelpv='kubectl delete pv' " >>$HOME/.zshrc
  echo -e "\nalias kepv='kubectl edit pv' " >>$HOME/.zshrc

  echo -e "\nkyml() {kubectl explain \$1 | egrep '<.*>'}" >>$HOME/.zshrc
  echo -e '\nprecmd() {
  echo -e "\n\n"
}' >>.zshrc

  # Update yq version
  echo -e "\n\nUpdating yq version"
  sudo apt remove yq -y && snap install yq

  # Run ZSh
  zsh
}
