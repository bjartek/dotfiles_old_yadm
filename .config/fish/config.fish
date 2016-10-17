# Path to Oh My Fish install.
set -gx OMF_PATH ~/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG ~/.config/omf

set -U fish_key_bindings fish_vi_key_bindings
set -g theme_date_format "+%H:%M"
set -g theme_nerd_fonts yes

source $OMF_CONFIG/local.fish
source $OMF_CONFIG/secret.fish

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

				set -x PATH $PATH $HOME/bin

set -x LANG en_US.UTF-8

function mci; mvn clean install; end
set -x MAVEN_OPTS "-Xmx3072m -XX:MaxPermSize=512m"

function l; ls; end

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH /usr/local/opt/go/libexec/bin

function server -d 'run server in current directory'
  set -l port $argv[1]

  if test -n "$port"
    python -m SimpleHTTPServer $port
  else
    python -m SimpleHTTPServer 3000
  end
end

