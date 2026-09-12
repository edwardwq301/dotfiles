if status is-interactive
    if command -q zoxide
        zoxide init fish | source
    end

    if test -x "$HOME/.local/bin/mise"
        "$HOME/.local/bin/mise" activate fish | source
    end
end

fish_add_path /opt/nvim-linux-x86_64/bin

set -gx EDITOR nvim
