set -e

echo "\033[0;34mCloning submodules...\033[0m"
git submodule update

echo "\033[0;34mInstall zsh...\033[0m"
sh $PWD/oh-my-zsh/tools/install.sh

echo "\033[0;34mCreating symlinks...\033[0m"
if [ -d ~/.vim ] || [ -h ~/.vim ]; then
    echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32mBacking up to ~/.vim.back\033[0m";
    mv ~/.vim ~/.vim.back;
fi

ln -s $PWD/vim $HOME/.vim

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.back\033[0m";
fi

ln -s $PWD/vimrc $HOME/.vimrc

if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
    echo "\033[0;33mFound ~/.tmux.conf.\033[0m \033[0;32mBacking up to ~/.tmux.conf.bak\033[0m";
fi

ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.back\033[0m";
fi

ln -s $PWD/zsh/zshrc $HOME/.zshrc

if [ -f ~/.dir_colors ] || [ -h ~/.dir_colors ]; then
    echo "\033[0;33mFound ~/.dir_colors.\033[0m \033[0;32mBacking up to ~/.dir_colors.back\033[0m";
fi

ln -s $PWD/dircolors-solarized/dircolors.256dark $HOME/.dir_colors
