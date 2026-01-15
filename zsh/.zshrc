export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/opt/nvim-linux-x86_64/bin:/usr/local/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.cargo/bin

source <(fzf --zsh)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#nvm end

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
mkdir -p $PNPM_HOME
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export EDITOR=nvim
export VISUAL=nvim

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$PATH:$HOME/Library/Python/3.9/bin
  export CF_PEM_LOCATION=/Library/Application\ Support/Cloudflare/installed_cert.pem
  export NODE_EXTRA_CA_CERTS=$CF_PEM_LOCATION
  export AWS_CA_BUNDLE=$CF_PEM_LOCATION
  export REQUESTS_CA_BUNDLE=$CF_PEM_LOCATION
  export SSL_CERT_FILE=$CF_PEM_LOCATION
fi
