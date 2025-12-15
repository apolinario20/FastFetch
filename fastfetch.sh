#!/bin/bash

clear

# ==============================
#  INSTALADOR AUTOMÁTICO DO FASTFETCH
#  Feito por Apolinário
# ==============================

# Arte ASCII
cat << "EOF"

  ______               _____   _______   ______   ______   _______    _____   _    _ 
 |  ____|     /\      / ____| |__   __| |  ____| |  ____| |__   __|  / ____| | |  | |
 | |__       /  \    | (___      | |    | |__    | |__       | |    | |      | |__| |
 |  __|     / /\ \    \___ \     | |    |  __|   |  __|      | |    | |      |  __  |
 | |       / ____ \   ____) |    | |    | |      | |____     | |    | |____  | |  | |
 |_|      /_/    \_\ |_____/     |_|    |_|      |______|    |_|     \_____| |_|  |_|
                                                                                                                                                                          

                         Instalador Automático do Fastfetch
                               Feito por Apolinário
EOF

echo ""
echo ">>> Detectando a arquitetura do sistema..."
ARCH=$(dpkg --print-architecture)

echo ">>> Arquitetura detectada: $ARCH"
echo ""

# Seleciona a URL correta de acordo com a arquitetura
case $ARCH in
    amd64)
        URL="https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb"
        ;;
    arm64)
        URL="https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-arm64.deb"
        ;;
    *)
        echo "❌ Arquitetura não suportada: $ARCH"
        echo "Arquiteturas suportadas: amd64, arm64"
        exit 1
        ;;
esac

echo ">>> Instalando dependências..."
sudo apt update -y

echo ""
echo ">>> Baixando o pacote do Fastfetch..."
cd /tmp || exit
wget -q "$URL" -O fastfetch.deb

if [ ! -f "fastfetch.deb" ]; then
    echo "❌ Falha no download!"
    exit 1
fi

echo ">>> Instalando o Fastfetch..."
sudo apt install ./fastfetch.deb -y

if ! command -v fastfetch >/dev/null 2>&1; then
    echo "❌ Falha na instalação!"
    exit 1
fi

echo ""
echo "==========================================="
echo "   ✅ Fastfetch instalado com sucesso!"
echo "   🎉 Aproveite a ferramenta de informações!"
echo "   🔥 Script feito por Apolinário"
echo "==========================================="
echo ""
fastfetch
