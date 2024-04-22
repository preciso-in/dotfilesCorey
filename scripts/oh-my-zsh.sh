mkdir git_repos

cd git_repos && git clone https://github.com/ohmyzsh/ohmyzsh.git

cd $HOME && ln -sf $PWD/git_repos/oh-my-zsh .oh-my-zsh
