#!/usr/bin/env bash
# Set up a new CloudOS interactive instance

set -eu

# Install pixi
conda install pixi -y

# Update pixi global config
mkdir -p "${HOME}/.pixi"
printf 'default-channels = ["conda-forge", "bioconda"]\n' >> "${HOME}/.pixi/config.toml"

# Install global packages with pixi
pixi global install gh git starship nano ripgrep cookiecutter

# Add pixi global executables to PATH
PIXI_HOME="${HOME}/.pixi"
export PIXI_HOME
PATH="${PIXI_HOME}/bin:${PATH}"
export PATH

# Update .bashrc with PIXI_HOME and PATH
printf '\nPIXI_HOME="${HOME}/.pixi" \n' >> "${HOME}/.bashrc"
printf 'export PIXI_HOME \n' >> "${HOME}/.bashrc"
printf 'PATH="${PIXI_HOME}/bin:${PATH}" \n' >> "${HOME}/.bashrc"
printf 'export PATH \n' >> "${HOME}/.bashrc"

# Install Oh My Zsh: 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Change shell to zsh
printf '[ -f "/usr/bin/zsh" ] && exec "/usr/bin/zsh" -l \n' >> "${HOME}/.bashrc"

# Add starship config to ~/.zshrc
printf '\n# Starship\n' >> "${HOME}/.zshrc"
printf 'eval "$(starship init zsh)"\n' >> "${HOME}/.zshrc"

# Install vscode extensions:
code-server --install-extension usernamehw.errorlens
code-server --install-extension tamasfe.even-better-toml
code-server --install-extension smcpeak.default-keys-windows
code-server --install-extension vscode-icons-team.vscode-icons
code-server --install-extension snakemake.snakemake-lang
code-server --install-extension tfehlmann.snakefmt
code-server --install-extension timonwong.shellcheck
code-server --install-extension charliermarsh.ruff
code-server --install-extension mechatroner.rainbow-csv
code-server --install-extension ms-python.debugpy
code-server --install-extension ms-python.python
code-server --install-extension ms-toolsai.jupyter
code-server --install-extension mads-hartmann.bash-ide-vscode
code-server --install-extension aaron-bond.better-comments

# These extensions may fail to install; they are incompatible
# with the current version of code-server.
code-server --install-extension ms-python.vscode-pylance
code-server --install-extension ms-python.vscode-python-envs
code-server --install-extension renan-r-santos.pixi-code

# Update Ruff extension
code-server --install-extension charliermarsh.ruff@2026.34.0

# Restart the shell to apply changes
bash

# Authorise GitHub access
# gh auth login

# Start a cookiecutter project
# cookiecutter https://github.com/alexblakes/cookiecutter-genomics.git
