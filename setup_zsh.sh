#!/bin/bash

# Atualizar pacotes e instalar Zsh
sudo apt update
sudo apt install -y zsh

# Instalar curl, necessário para baixar o script do Oh My Zsh
sudo apt install -y curl

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Definir o Zsh como o shell padrão
chsh -s $(which zsh)

# Atualizar pacotes novamente
sudo apt update

# Instalar o gerenciador de fontes
sudo apt install -y font-manager

# Baixar a fonte MesloLGS NF Regular
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O /tmp/MesloLGS_NF_Regular.ttf

# Criar o diretório de fontes do usuário, se não existir
mkdir -p ~/.local/share/fonts

# Mover a fonte baixada para o diretório de fontes do usuário
mv /tmp/MesloLGS_NF_Regular.ttf ~/.local/share/fonts/

# Atualizar o cache de fontes
fc-cache -fv

# Clonar o repositório do tema Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Configurar o Powerlevel10k no .zshrc
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

