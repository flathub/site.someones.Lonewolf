FROM archlinux

RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime

RUN pacman-key --init
RUN pacman -Sy archlinux-keyring --noconfirm && \
    pacman -Syu --noconfirm \
                            bash \
                            git \
                            python \
                            python-pipx \
                            python-aiohttp \
                            python-toml \
                            flatpak \
                            flatpak-builder

# list available runtimes with `flatpak remote-ls --user flathub | grep org.gnome.Sdk`

RUN flatpak install -y org.gnome.Platform//48 org.gnome.Sdk//48 runtime/org.freedesktop.Sdk.Extension.rust-stable/x86_64/24.08 runtime/org.freedesktop.Sdk.Extension.node22/x86_64/24.08

WORKDIR /

