
mklink /J "%APPDATA%\alacritty" "%CD%/alacritty"

git clone --depth 1 https://github.com/AstroNvim/AstroNvim %LocalAppData%\nvim

mklink /J %LocalAppData%\nvim\lua\user "%CD%/nvim"
