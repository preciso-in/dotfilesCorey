pushd git_repos
git clone https://github.com/ohmyzsh/ohmyzsh.git
popd

pushd $HOME
ln -s $PWD/git_repos/oh-my-zsh .oh-my-zsh
popd
