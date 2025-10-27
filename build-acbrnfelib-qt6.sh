#!/bin/bash

#deps libxml2-dev, mingw-w64, fp-compiler, fpc
set -e
sudo apt install libxml2-dev mingw-w64 fp-compiler fpc
sudo apt install lcl --no-install-recommends

sudo ln -s /usr/bin/x86_64-w64-mingw32-windres /usr/bin/windres

lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/synapse/laz_synapse.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrComum/ACBrComum.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrOpenSSL/ACBrOpenSSL.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDiversos/ACBrDiversos.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/PCNComum/PCNComum.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrIntegrador/ACBr_Integrador.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrTCP/ACBrTCP.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDFe/ACBrDFeComum.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDFe/ACBrNFe/ACBr_NFe.lpk
# fortes repo: https://github.com/fortesinformatica/fortesreport-ce.git
lazbuild --ws=qt6 fortesreport-ce/Packages/frce.lpk 
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDFe/ACBrDFeReportRL.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDFe/ACBrNFe/DANFE/NFe/Fortes/ACBr_NFe_DanfeRL.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrSerial/ACBrSerial.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDFe/ACBrNFe/DANFE/NFCe/EscPos/ACBr_NFe_DanfeESCPOS.lpk
lazbuild --ws=qt6 ACBr/Pacotes/Lazarus/ACBrDFe/ACBrNFe/DANFE/NFe/FPDF/ACBr_NFe_DanfeFPDF.lpk

# --ws=qt6 do not work on linux mint because there is no qt6pas
lazbuild --ws=qt6 ACBr/Projetos/ACBrLib/Fontes/NFe/ACBrLibNFe.lpr
echo "Compilação efetuada com sucesso em ACBr/Projetos/ACBrLib/Fontes/NFe/bin"
