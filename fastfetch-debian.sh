#!/bin/bash

clear

# ==============================
#  INSTALADOR AUTOMÁTICO DO FASTFETCH
#  Versão compatível com Debian 11
#  Feito por Apolinario20
# ==============================

# Arte ASCII
cat << "EOF"

  ______               _____   _______   ______   ______   _______    _____   _    _ 
 |  ____|     /\      / ____| |__   __| |  ____| |  ____| |__   __|  / ____| | |  | |
 | |__       /  \    | (___      | |    | |__    | |__       | |    | |      | |__| |
 |  __|     / /\ \    \___ \     | |    |  __|   |  __|      | |    | |      |  __  |
 | |       / ____ \   ____) |    | |    | |      | |____     | |    | |____  | |  | |
 |_|      /_/    \_\ |_____/     |_|    |_|      |______|    |_|     \_____| |_|  |_|
                                                                                                                                                                          

                 Instalador Automático do Fastfetch (v2.18.0)
                           Feito por Apolinario20
EOF

echo ""
echo ">>> Detectando a arquitetura do sistema..."
ARCH=$(dpkg --print-architecture)

echo ">>> Arquitetura detectada: $ARCH"
echo ""

# Apenas amd64 é suportado neste instalador
if [ "$ARCH" != "amd64" ]; then
    echo "❌ Arquitetura não suportada: $ARCH"
    echo "Este instalador suporta apenas amd64"
    exit 1
fi

echo ">>> Atualizando lista de pacotes..."
sudo apt update -y

echo ""
echo ">>> Baixando o Fastfetch v2.18.0..."
cd /tmp || exit
wget -q https://github.com/fastfetch-cli/fastfetch/releases/download/2.18.0/fastfetch-linux-amd64.deb -O fastfetch.deb

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
echo "   ✅ Fastfetch v2.18.0 instalado com sucesso!"
echo "   🎉 Compatível com Debian 11"
echo "   🔥 Script feito por Apolinario20"
echo "==========================================="
echo ""
fastfetch
