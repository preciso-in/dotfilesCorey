#! /usr/bin/env zsh

echo -e "\nInstalling OhMyZSh"

if ! [ -d ../git_repos ]; then
  mkdir ../git_repos
fi

pushd ../git_repos
if [ -d ohmyzsh ]; then
  rm -rf ohmyzsh
fi
git clone https://github.com/ohmyzsh/ohmyzsh.git
popd

ln -sf "$(dirname $PWD)/git_repos/ohmyzsh" $HOME/.oh-my-zsh

# Clone zsh-syntax-highlighting repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Clone zsh-autosuggestions repo
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

#TODO: Update this to use Dotfiles Directory rather than relative path
