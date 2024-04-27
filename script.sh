#!/bin/bash

# Atualiza os pacotes do sistema
sudo apt update 
# Atualiza os pacotes para as versões mais recentes
sudo apt upgrade -y 

echo
echo "   ####     ####    ##  ##   ######    ####    ######     ## ";
echo "  ##  ##   ##  ##   ### ##   ##       ##  ##     ##      #### ";
echo "  ##       ##  ##   ######   #####    ##         ##     ##  ## ";
echo "  ##       ##  ##   ######   ##       ##         ##     ##  ## ";
echo "  ##  ##   ##  ##   ## ###   ##       ##  ##     ##     ###### ";
echo "   ####     ####    ##  ##   ######    ####      ##     ##  ## ";
echo 

# Verifica se o Java está instalado
java_installed=$(java -version 2>&1)
if [[ "$java_installed" == *"not found"* ]]; then
    echo
    echo "**************************************************"
    echo "*                                                *"
    echo "*          Java não está instalado.              *"
    echo "*      Iniciando a instalação da versão 17...    *"
    echo "*                                                *"
    echo "**************************************************"
    echo

    sudo apt install openjdk-17-jre -y
else
    current_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo
    echo "**************************************************"
    echo "*                                                *"
    echo "*             Java já está instalado.            *"
    echo "*         Versão atual: $current_version         *"
    echo "*                                                *"
    echo "**************************************************"
    echo

    # Verifica se a versão instalada é inferior a 17
    if [[ "${current_version%%.*}" -lt 17 ]]; then
        echo
        echo "**************************************************"
        echo "*                                                *"
        echo "*    A versão atual do Java é inferior a 17.     *"
        echo "*          Iniciando a atualização...            *"
        echo "*                                                *"
        echo "**************************************************"
        echo

        sudo apt install openjdk-17-jre -y
    fi
fi

java -jar jar-conecta-1.0-SNAPSHOT-jar-with-dependencies.jar