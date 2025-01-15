FROM archlinux:base-devel

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    git \
    base-devel \
    python \
    python-pip \
    python-pynvim \
    neovim \
    nodejs \
    npm \
    ripgrep \
    wget \
    unzip \
    tmux \
    xclip \
    go \
    rust \
    php \
    lua \
    luarocks \
    ruby \
    jdk-openjdk \
    julia \
    composer \
    tree-sitter \
    fd 

RUN npm install -g neovim prettier

RUN mkdir -p /root/.virtualenvs && \
    python -m venv /root/.virtualenvs/neovim

ENV PATH="/root/.virtualenvs/neovim/bin:$PATH"
ENV VIRTUAL_ENV="/root/.virtualenvs/neovim"

RUN pip uninstall -y pynvim neovim && \
    pip install --no-cache-dir pynvim neovim ruff


RUN go install mvdan.cc/sh/v3/cmd/shfmt@latest
ENV PATH="/root/go/bin:${PATH}"

RUN git clone https://github.com/Dadd0/.dotfiles.git /root/.dotfiles

RUN mkdir -p /root/.config && \
    ln -s /root/.dotfiles/nvim /root/.config/

ENV EDITOR=nvim
ENV VISUAL=nvim
ENV TERM=xterm-256color

# Set default command
CMD ["nvim"]
