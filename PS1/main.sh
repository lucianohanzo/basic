#!/bin/bash

# Verifica se os arquivos de complementos existem!
arquivos=("./PS1.sh")
for a in "${arquivos[@]}"; do
    if [ -f "$a" ]; then
        source "$a"
    else
        echo "Arquivo $a não existe!"
        exit 24
    fi
done


# Verifica se o arquivo .bashrc existe!
if [ ! -f "$HOME/.bashrc" ]; then
    cp /etc/skel/.bashrc "$HOME/.bashrc"
fi

# Coleta informações do arquivo .bashrc
testa_root=$(grep "# Variável PS1 para o root." ~/.bashrc 2> /dev/null)
testa_comun=$(grep "# Variável PS1 para usuário comum." ~/.bashrc 2> /dev/null)

# Muda a variável PS1, caso já não tenha sido modificada.
usuario=$(whoami)
if [ "$usuario" = "root" ]; then
    if [ "$testa_root" != "# Variável PS1 para o root." ]; then
        echo "$user_root" >> "$HOME/.bashrc"
    fi
else
    if [ "$testa_comum" != "# Variável PS1 para usuário comum." ]; then
        echo "$user_comum" >> "$HOME/.bashrc"
    fi
fi

