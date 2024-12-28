
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/viviane/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/viviane/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/viviane/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/viviane/miniconda3/bin:$PATH"
	export PATH="/Users/viviane/Downloads/kafka-3.7.0-src/bin:$PATH"

    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/scala@2.13/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/google-cloud-sdk/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/viviane/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/viviane/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/viviane/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/viviane/google-cloud-sdk/completion.zsh.inc'; fi
