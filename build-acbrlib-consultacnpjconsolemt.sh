#!/bin/bash
set -e

sudo apt install -y libxml2-dev mingw-w64 fp-compiler fpc
sudo apt install -y lcl --no-install-recommends

ACBR_DIR="/home/radialista/git-repos/acbr-build/ACBr"

export ACBR_PATHS="
$ACBR_DIR/Projetos/ACBrLib/Fontes/Comum
$ACBR_DIR/Fontes/ACBrComum
$ACBR_DIR/Fontes/ACBrTCP
$ACBR_DIR/Fontes/ACBrTCP/ACBrConsultaCNPJ
$ACBR_DIR/Fontes/ACBrOpenSSL
$ACBR_DIR/Fontes/ACBrDiversos
$ACBR_DIR/Fontes/Terceiros/synalist
$ACBR_DIR/Fontes/Terceiros/GZIPUtils
$ACBR_DIR/Fontes/Terceiros/FastStringReplace
"

CFG_DIR="$HOME/.fpc.cfg.d"
CFG_FILE="$CFG_DIR/acbr.cfg"

mkdir -p "$CFG_DIR"

cat > "$CFG_FILE" <<EOF
# Configuração ACBr adicionada automaticamente
# Todas estas paths vêm da variável de ambiente ACBR_PATHS
-Fu\$ACBR_PATHS
-Fi\$ACBR_PATHS
EOF

FPC_COMPILER="/usr/bin/ppcx64"
CPU_TARGET="x86_64"

WIDGETSET="gtk2"

BUILD_MODE="Linux-x86_64-MT"

build_package() {
    local pkg="$1"
    echo " -- Compilando: $pkg --"
    lazbuild \
        --compiler="$FPC_COMPILER" \
        --cpu="$CPU_TARGET" \
        --ws="$WIDGETSET" \
        --build-mode="$BUILD_MODE" \
        "$pkg"
}

if [ ! -L /usr/bin/windres ]; then
  echo "Criando link simbólico para windres..."
  sudo ln -s /usr/bin/x86_64-w64-mingw32-windres /usr/bin/windres
fi

build_package "$ACBR_DIR/Pacotes/Lazarus/synapse/laz_synapse.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrComum/ACBrComum.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrOpenSSL/ACBrOpenSSL.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDiversos/ACBrDiversos.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrTCP/ACBrTCP.lpk"

build_package "$ACBR_DIR/Projetos/ACBrLib/Fontes/ConsultaCNPJ/ACBrLibConsultaCNPJConsoleMT.lpi"

echo "=============================================="
echo " Compilação concluída com sucesso!"
