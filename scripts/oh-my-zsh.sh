DIRECTORY="git_repos"

if [ -d "$DIRECTORY" ]; then
  rm -rf $DIRECTORY
fi

mkdir $DIRECTORY
cd $DIRECTORY && git clone https://github.com/ohmyzsh/ohmyzsh.git

pushd $HOME
echo $PWD
exit
git_repos/oh-my-zsh .oh-my-zsh
popd
