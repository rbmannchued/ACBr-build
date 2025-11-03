#!/bin/bash

#deps libxml2-dev, mingw-w64, fp-compiler, fpc
set -e

sudo apt install libxml2-dev mingw-w64 fp-compiler fpc
sudo apt install lcl --no-install-recommends

ACBR_DIR="./ACBr"
FORTES_DIR="./fortesreport-ce"
FPC_COMPILER="/usr/bin/ppcx64"
CPU_TARGET="x86_64"
#qt6 qt5 gtk2 gtk3..
WIDGETSET="qt6"
BUILD_MODE="Linux-x86_64-MT"

build_package() {
    local pkg_path="$1"
    echo " -- Compilando pacote: $pkg_path --"
    lazbuild \
        --compiler="$FPC_COMPILER" \
        --cpu="$CPU_TARGET" \
        --ws="$WIDGETSET" \
        --build-mode="$BUILD_MODE" \
        "$pkg_path"
}

if [ ! -L /usr/bin/windres ]; then
  echo "Criando link simbólico para windres..."
  sudo ln -s /usr/bin/x86_64-w64-mingw32-windres /usr/bin/windres
fi

build_package "$ACBR_DIR/Pacotes/Lazarus/synapse/laz_synapse.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrComum/ACBrComum.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrOpenSSL/ACBrOpenSSL.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDiversos/ACBrDiversos.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/PCNComum/PCNComum.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrIntegrador/ACBr_Integrador.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrTCP/ACBrTCP.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDFe/ACBrDFeComum.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDFe/ACBrNFe/ACBr_NFe.lpk"
# fortes repo: https://github.com/fortesinformatica/fortesreport-ce.git
build_package "$FORTES_DIR/Packages/frce.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDFe/ACBrDFeReportRL.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDFe/ACBrNFe/DANFE/NFe/Fortes/ACBr_NFe_DanfeRL.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrSerial/ACBrSerial.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDFe/ACBrNFe/DANFE/NFCe/EscPos/ACBr_NFe_DanfeESCPOS.lpk"
build_package "$ACBR_DIR/Pacotes/Lazarus/ACBrDFe/ACBrNFe/DANFE/NFe/FPDF/ACBr_NFe_DanfeFPDF.lpk"

# --ws=qt6 do not work on linux mint because there is no qt6pas
build_package "$ACBR_DIR/Projetos/ACBrLib/Fontes/NFe/ACBrLibNFe.lpr"
echo "Compilação efetuada com sucesso em ACBr/Projetos/ACBrLib/Fontes/NFe/bin"
