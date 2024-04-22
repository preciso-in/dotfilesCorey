DIRECTORY="git_repos"

if [ -d "$DIRECTORY" ]; then
  rm -rf $DIRECTORY
fi

mkdir $DIRECTORY
cd $DIRECTORY && git clone https://github.com/ohmyzsh/ohmyzsh.git

cd $HOME && ln -sf $PWD/git_repos/oh-my-zsh .oh-my-zsh
