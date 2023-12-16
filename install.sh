#!/usr/bin/env bash

source ./zsh/zshenv

mkdir -p "$XDG_CONFIG_HOME"

########
# nvim #
########

mkdir -p "$VIMCONFIG"
ln -sf "$DOTFILES/nvim/init.lua" "$VIMCONFIG"
ln -sf "$DOTFILES/nvim/.luarc.json" "$VIMCONFIG"
ln -sf "$DOTFILES/nvim/lazy-lock.json" "$VIMCONFIG"

rm -rf "$VIMCONFIG/after"
ln -sf "$DOTFILES/nvim/after" "$VIMCONFIG"

rm -rf "$VIMCONFIG/lua"
ln -sf "$DOTFILES/nvim/lua" "$VIMCONFIG"

######
# i3 #
######

rm -rf "$I3CONFIG"
ln -sf "$DOTFILES/i3" "$XDG_CONFIG_HOME"

#######
# zsh #
#######

mkdir -p "$ZDOTDIR"
ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv" 
ln -sf "$DOTFILES/zsh/zprofile" "$ZDOTDIR/.zprofile" 
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/aliases" "$ZDOTDIR/.aliases"

rm -rf "$ZDOTDIR/external"
ln -sf "$DOTFILES/zsh/external" "$ZDOTDIR"

#######
# X11 #
#######

mkdir -p "$XDG_CONFIG_HOME/X11"

ln -sf "$DOTFILES/X11/.xinitrc" "$XINITRC"
ln -sf "$DOTFILES/X11/.Xresources" "$XDG_CONFIG_HOME/X11/.Xresources"

#########
# dunst #
#########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

########
# tmux #
########

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

if [ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ]
then
    git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"
fi

mkdir -p "$XDG_CONFIG_HOME/tmuxp"
ln -sf "$DOTFILES/tmuxp/dotfiles.yml" "$XDG_CONFIG_HOME/tmuxp/dotfiles.yml"
ln -sf "$DOTFILES/tmuxp/arch_installer.yml" "$XDG_CONFIG_HOME/tmuxp/arch_installer.yml"

#############
# Alacritty #
#############

mkdir -p "$XDG_CONFIG_HOME/alacritty"
ln -sf "$DOTFILES/alacritty/alacritty.yml" "$XDG_CONFIG_HOME/alacritty/alacritty.yml"

##########
# clangd #
##########

mkdir -p "$XDG_CONFIG_HOME/clangd"
ln -sf "$DOTFILES/clangd/config.yaml" "$XDG_CONFIG_HOME/clangd/config.yaml"

########
# htop #
########

mkdir -p "$XDG_CONFIG_HOME/htop"
ln -sf "$DOTFILES/htop/htoprc" "$XDG_CONFIG_HOME/htop/htoprc"

######
# lf #
######

rm -rf "$XDG_CONFIG_HOME/lf"
ln -s "$DOTFILES/lf" "$XDG_CONFIG_HOME"

#######
# mpd #
#######

mkdir -p "$XDG_CONFIG_HOME/mpd"
ln -sf "$DOTFILES/mpd/mpd.conf" "$XDG_CONFIG_HOME/mpd/mpd.conf"

#######
# mpv #
#######

mkdir -p "$XDG_CONFIG_HOME/mpv"
ln -sf "$DOTFILES/mpv/scripts" "$XDG_CONFIG_HOME/mpv"
ln -sf "$DOTFILES/mpv/input.conf" "$XDG_CONFIG_HOME/mpv/input.conf"
ln -sf "$DOTFILES/mpv/mplayer-input.conf" "$XDG_CONFIG_HOME/mpv/mplayer-input.conf"
ln -sf "$DOTFILES/mpv/mpv.conf" "$XDG_CONFIG_HOME/mpv/mpv.conf"

###########
# ncmpcpp #
###########

mkdir -p "$XDG_CONFIG_HOME/ncmpcpp"
ln -sf "$DOTFILES/ncmpcpp/config" "$XDG_CONFIG_HOME/ncmpcpp/config"
ln -sf "$DOTFILES/ncmpcpp/bindings" "$XDG_CONFIG_HOME/ncmpcpp/bindings"

############
# neofetch #
############

mkdir -p "$XDG_CONFIG_HOME/neofetch"
ln -sf "$DOTFILES/neofetch/config.conf" "$XDG_CONFIG_HOME/neofetch/config.conf"

#########
# picom #
#########

mkdir -p "$XDG_CONFIG_HOME/picom"
ln -sf "$DOTFILES/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"

###########
# polybar #
###########

rm -rf "$XDG_CONFIG_HOME/polybar"
ln -s "$DOTFILES/polybar" "$XDG_CONFIG_HOME"

###########
# sioyek #
###########

rm -rf "$XDG_CONFIG_HOME/sioyek"
ln -s "$DOTFILES/sioyek" "$XDG_CONFIG_HOME"

############
# pipewire #
############

rm -rf "$XDG_CONFIG_HOME/pipewire"
ln -s "$DOTFILES/pipewire" "$XDG_CONFIG_HOME"

##############
# pulsemixer #
##############

ln -sf "$DOTFILES/pulsemixer/pulsemixer.cfg" "$XDG_CONFIG_HOME/pulsemixer.cfg"
