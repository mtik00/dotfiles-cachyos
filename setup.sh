#!/bin/bash
set -euo pipefail

PATH="~/bin:${PATH}"

# Set up files in the home directory
if [[ -d ~/.local/share/chezmoi/.git ]]; then
    chezmoi update && printf "\n%s\n" "...Chezmoi update complete"
else
    pushd "${HOME}" && sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply mtik00/dotfiles-cachyos && popd && printf "\n%s\n" "...Chezmoi update complete"
fi

