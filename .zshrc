# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "chmouel/oh-my-zsh-openshift"
zplug "supercrabtree/k"
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "joshuarubin/zsh-homebrew"
zplug "b4b4r07/zsh-vimode-visual", 				    use:"*.sh"
zplug "simnalamburt/shellder"
zplug "hchbaw/auto-fu.zsh", at:pu
zplug "zsh-users/zaw"
zplug "plugins/fasd", from:oh-my-zsh

# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load
alias j='fasd_cd -d'
