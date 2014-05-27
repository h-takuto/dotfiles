#dotfiles#
##How to use##
$git clone http://github.com/teari/dotfiles.git  
make  

####or####

$./setup.sh

##Vundle##
git submodule add https://github.com/gmarik/vundle.git ~/dotfiles/.vim/vundle.git  
vim
:BundleInstall  
