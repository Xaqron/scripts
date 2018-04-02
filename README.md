# install-node.sh

This bash script automatically:

* Installs LTS node.js via [nvm](https://github.com/creationix/nvm) (node version manager).

* Installs latest stable [npm](https://www.npmjs.com) (node.js package manager).

* Installs latest stable [pm2](http://pm2.keymetrics.io) (used for running node.js applications as daemon).

## Usage

```bash
curl -o- https://raw.githubusercontent.com/Xaqron/scripts/master/install-node.sh | bash
```

# install-python.sh

This bash script automatically:

* Installs LTS python via [pyenv](https://github.com/pyenv/pyenv-installer) (python version manager).

* Installs latest stable [pip](https://pypi.python.org/pypi) (python package manager).

* Installs latest stable [setuptools](https://pypi.python.org/pypi/setuptools).

* Installs latest stable [virtualenv](https://docs.python.org/3/library/venv.html).

## Usage

```bash
curl -o- https://raw.githubusercontent.com/Xaqron/scripts/master/install-python.sh | bash
```