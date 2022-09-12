# install homebrew
echo "running brew update..."
if [ ! -x "`which brew`" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
fi

# GUI app
casks=(
    azure-data-studio
    browserstacklocal
    clipy
    cyberduck
    discord
    firefox
    google-chrome
    hyperswitch
    insomnia
    slack
    visual-studio-code
    vlc
    zoom
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

# CUI app
formulas=(
    ffmpeg
    gh
    ghq
    git
    go
    make
    nodebrew
    openssh
    starship
    yarn
)

echo "brew install formula"
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

# install node
mkdir -p ~/.nodebrew/src
nodebrew install-binary 16.14.2
nodebrew use 16.14.2
node -v

# TODO: align dock
