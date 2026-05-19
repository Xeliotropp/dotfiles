if status is-interactive
    set fish_greeting "Здравей, свят!"
    fish_vi_key_bindings
    # Zoxide
    if test -f /usr/bin/zoxide
        zoxide init fish | source
    else
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    end
    # PATH
    fish_add_path ~/.config/composer/vendor/bin
    # fnm
    set FNM_PATH ~/.local/share/fnm
    if test -d $FNM_PATH
        fish_add_path $FNM_PATH
        fnm env --use-on-cd --shell fish | source
    end
    # Locale
    set -gx LC_ALL en_US.UTF-8
    set -gx LANG en_US.UTF-8
    # Editor
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    # Aliases
    alias cd='z'
    alias shutdown='shutdown -h now'
    alias ls='ls -lh --color=always --group-directories-first'
    alias mkdir='mkdir -p'
    alias yayf="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
    # fzf
    fzf --fish | source
    function sdk
        bass source ~/.sdkman/bin/sdkman-init.sh && sdk $argv
    end
    fish_config theme choose catppuccin-macchiato 
end
