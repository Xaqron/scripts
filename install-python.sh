echo "Installing prerequistics..."
echo

sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncurses5-dev libncursesw5-dev xz-utils tk-dev

echo
echo "Installing python version manager (pyenv)..."
echo

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# .bashrc content
echo >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

echo
echo "Installing LTS python..."
echo

echo "DEBUG: pyenv version= $(pyenv --version)"

pyenv update
LTS=$(pyenv install -l | grep '[[:space:]][[:digit:]].[[:digit:]].[[:digit:]]$' | tail -1)
pyenv install $LTS
pyenv global $LTS

echo -e "\033[32m $(python -V) installed successfully in \"$(which python)\""
echo

pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade virtualenv

# pip install pylint

if [ ! -z $(command -v code) ]; then
   code --install-extension ms-python.python
fi

source ~/.bashrc

# TODO: autoconfigure extension
# path: ~/.config/Code/User/settings.json

echo
echo "To configure vscode:"
echo "- Edit File > Preferences > Settings."
echo "- Set vscode \"python.pythonPath\" to output of \"which python\" command."
echo "- Set vscode \"python.venvPath\" to \"/home/user/.pyenv/versions/v.v.v/envs\"."
echo "* For a new project in vscode edit \"launch.json\" and set \"stopOnEntry\": false"
echo
echo -e "\033[33m Done! Rebooting in 10 seconds..."
sleep 10
sudo reboot
