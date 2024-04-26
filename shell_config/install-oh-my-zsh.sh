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

#TODO: Update this to use Dotfiles Directory rather than relative path
