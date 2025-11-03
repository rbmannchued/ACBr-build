# ACBr-Build

Script para facilitar a compilação das ACBrLib sem a necessidade da instalação da IDE Lazarus completa.

OBS: A widget lib usada nos scripts é o qt6, para mudar, apenas edite a variavel ``WIDGETSET`` do script que pretende usar para gtk2, gtk3, qt5... talvez seja necessário instalar mais alguma dependência.

# Como usar

Baixe os repositorios(demora um pouco)
```
git submodule init
git submodule update
```

Então execute o script da sua lib(exemplo para nfe):

```
chmod +x ./build-acbrlib-nfe.sh
./build-acbrlib-nfe.sh
```

