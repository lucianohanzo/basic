#!/bin/bash

meu_dir_atual="$(dirname "$0")"


# Verifica se os arquivos de complementos existem!
arquivos=("./PS1.sh")
for a in "${arquivos[@]}"; do
    if [ -f "$meu_dir_atual/$a" ]; then
        source "$meu_dir_atual/$a"
    else
        echo "Arquivo $a não existe!"
        exit 24
    fi
done


# Verifica se os arquivos .bash* existem!
if [ ! -f "$HOME/.bashrc" ]; then
    cp /etc/skel/.bashrc "$HOME/.bashrc"
fi

if [ ! -f "$HOME/.bash_profile" ]; then
    cp /etc/skel/.bash_profile "$HOME/.bash_profile"
fi


# Coleta informações do arquivo .bashrc
testa_root=$(grep "# Variável PS1 para o root." \
"$HOME/.bashrc" | head -n1 2> /dev/null)
testa_comum=$(grep "# Variável PS1 para usuário comum." \
"$HOME/.bashrc" | head -n1 2> /dev/null)


# Muda a variável PS1, caso já não tenha sido modificada.
usuario=$(whoami)
if [ "$usuario" = "root" ]; then
    if [ "$testa_root" != "# Variável PS1 para o root." ]; then
        echo "$user_root" >> "$HOME/.bashrc"
    else
        echo "Já foi feito!"
    fi
else
    if [ "$testa_comum" != "# Variável PS1 para usuário comum." ]; then
        echo "$user_comum" >> "$HOME/.bashrc"
    else
        echo "Já foi feito!"
    fi
fi


# Executa o .bashrc
source "$HOME/.bashrc"



