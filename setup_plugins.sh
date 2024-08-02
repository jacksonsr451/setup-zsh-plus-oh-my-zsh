#!/bin/zsh

# Função para clonar ou atualizar um repositório Git
clone_or_update() {
  local repo_url=$1
  local dest_dir=$2

  if [ -d "$dest_dir" ]; then
    echo "Atualizando $dest_dir"
    git -C "$dest_dir" pull
  else
    echo "Clonando $repo_url em $dest_dir"
    git clone "$repo_url" "$dest_dir"
  fi
}

# Instalar plugins adicionais para facilitar o desenvolvimento
clone_or_update https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
clone_or_update https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
clone_or_update https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
clone_or_update https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
clone_or_update https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
clone_or_update https://github.com/MichaelAquilina/zsh-you-should-use ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-you-should-use
clone_or_update https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips

# Adicionar plugins ao .zshrc
sed -i '/^plugins=/c\plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-nvm zsh-you-should-use alias-tips)' ~/.zshrc

# Aplicar as alterações
source ~/.zshrc
