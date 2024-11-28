set fish_greeting "
 _  _  __ ____  __  ____ __  __ _ ____ 
/ )( \/  (    \/ _\(  __)  \(  ( (  __)
\ \/ (  O ) D (    \) _|  O )    /) _) 
 \__/ \__(____|_/\_(__) \__/\_)__|____)
"

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias g git
alias v nvim
alias ide "sh /home/ioannis-chouliaras/.config/tmux/switch_pane.sh"
alias generate_dataflow_project "bash /home/ioannis-chouliaras/Documents/vodafone/squad/tools/generate_project/main.sh"
alias google "open https://www.google.com"
alias vf 'nvim $(fzf --preview="batcat --color=always {}")'
alias commitizen-initialize "commitizen init cz-conventional-changelog --save-dev --save-exact"
alias save-tmux-session 'bash /home/ioannis-chouliaras/.config/fish/scripts/tmux-session.sh save'
alias restore-tmux-session 'bash /home/ioannis-chouliaras/.config/fish/scripts/tmux-session.sh restore'
alias capslock 'setxkbmap -option ctrl:swapcaps'
alias monitor 'xrandr --output HDMI-1-2 --auto'
alias rate 'xset r rate 200 150'
alias bar 'bash ~/.config/polybar/launch_polybar.sh'
alias greek 'setxkbmap -model pc104 -layout us,gr -option grp:win_space_toggle'
alias so "source ~/.config/fish/config.fish"
alias vpn "sudo openconnect -g vpn-agile -u ioannis.chouliaras@vodafone.com --useragen=AnyConnect vfras.vodafone.gr"
alias oo "cd /home/ioannis-chouliaras/Documents/second_brain/"
alias cof "nvim -p /home/ioannis-chouliaras/Documents/second_brain/inbox/*.md"
alias m math
alias tw tig
alias fo black
alias cl clear
alias gc gcloud
alias kb kubectl
alias gc_set_project "gcloud config set project"
alias wifi "nmcli device wifi"

if type -q eza
    alias ll "eza -l --icons"
    alias lla "ll -a --icons"
    alias ld "eza -lD --icons"
    alias lf "eza -lF --color=always | grep -v /"
    alias ls "eza -alF --color=always --sort=size | grep -v /"
    alias lt "eza -al --sort=modified"
    alias llt "eza -l --icons --tree"
end

# My functions
source ~/.config/fish/my_functions/create_env.fish
source ~/.config/fish/my_functions/git-set-remote.fish
source ~/.config/fish/my_functions/gc_composer_beta_upload.fish
source ~/.config/fish/my_functions/gc_data_beta_upload.fish
source ~/.config/fish/my_functions/cloud_functions.fish
source ~/.config/fish/my_functions/enable_disable_devices.fish
source ~/.config/fish/my_functions/log_cloud_function.fish
source ~/.config/fish/my_functions/create_obs_note.fish
source ~/.config/fish/my_functions/organize_obs_notes.fish



# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

# Neovim
set -U fish_user_paths /opt/nvim-linux64/bin $fish_user_paths
set -Ux GOPATH $HOME/go
set -U fish_user_paths $fish_user_paths $GOPATH/bin
set -x FZF_DEFAULT_COMMAND "find . -path './node_modules' -prune -o -path './ENV' -prune -o -path './.node_modules' -prune -o -path './.git' -prune -o -path './.venv' -prune -o -type f -print -o -type l -print"
set -Ux PATH /home/ioannis-chouliaras/.virtualenvs/debugpy/bin $PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ioannis-chouliaras/google-cloud-sdk/path.fish.inc' ]
    . '/home/ioannis-chouliaras/google-cloud-sdk/path.fish.inc'
end
