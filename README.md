#dotfiles#
##How to use##
$git clone http://github.com/teari/dotfiles.git  

make  

####or####

$./setup.sh  

##NeoBundle##
mkdir -p ~/.vim/bundle  
git clone https://github.com/Shougo/neobundle.git ~/.vim/bundle/neobundle.vim  
vim  
:NeoBundleInstall  
