alias hx=helix
alias ae='source .venv/bin/activate'
alias zed='zeditor'
alias k=kubectl

eval "$(starship init bash)"

lc() {
    latexmk -pdf -pvc -interaction=nonstopmode "$@"
}
