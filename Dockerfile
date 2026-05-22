# FROM almalinux:9
# AlmaLinux 9 minimal ベース
FROM almalinux:9-minimal

# enviroment
ENV HTTP_PROXY=http://172.24.13.20:12080
ENV HTTPS_PROXY=http://172.24.13.20:12080
ENV NO_PROXY="localhost,127.0.0.1,::1,172.24.100.129"

# リポジトリ修正
RUN grep -l 'mirrorlist' /etc/yum.repos.d/*.repo | xargs sed -i.bak -e 's/^mirrorlist/# mirrorlist/g' \
	&& grep -l 'baseurl' /etc/yum.repos.d/*.repo | xargs sed -i.bak -e 's|^# baseurl|baseurl|g'

# User
# uid=1009(shimada) gid=1009(shimada) groups=1009(shimada),974(docker),1013(mesw),1014(s21)
RUN groupadd -g 1009 shimada; exit 0
RUN useradd -m -s /bin/bash -u 1009 -g 1009 shimada
RUN echo shimada:abcd1234 | chpasswd
RUN echo "shimada   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# ----- 基本ツール / dnf を導入（minimal は microdnf のため）-----
# ビルド系（Vimをソースから）
# Python 3.11（一式）
# Node.js (AppStream module; 20を例に)
# X11 転送用（クライアント側ライブラリ等）
RUN microdnf -y install dnf \
	&& dnf -y update \
	&& dnf -y install \
		git tar which ca-certificates \
		gcc gcc-c++ make autoconf automake libtool pkgconfig \
		ncurses-devel gettext \
		python3.11 python3.11-devel python3.11-pip \
	&& dnf -y install curl --allowerasing \
	&& dnf -y module enable nodejs:20 \
	&& dnf -y install nodejs npm \
		xorg-x11-xauth xorg-x11-utils \
	&& dnf clean all

# ----- Vim 9.2 をソースからビルド -----
# ※ VIM_TAG は v9.2.x のタグに変更可能（例: v9.2.0000）
ARG VIM_TAG=v9.2.0100
RUN git clone https://github.com/vim/vim.git /tmp/vim \
	&& cd /tmp/vim \
	&& git fetch --tags && git checkout ${VIM_TAG} || true \
	&& ./configure \
		--with-features=huge \
		--enable-multibyte \
		--enable-terminal \
		--enable-python3interp=yes \
		--with-python3-command=python3.11 \
		--prefix=/usr/local \
	&& make -j"$(nproc)" \
	&& make install \
	&& vim --version | head -n 1 \
	&& rm -rf /tmp/vim

# ----- Codex CLI を npm でグローバル導入 -----
# 公式は npm のグローバル or Homebrew を案内。Linux では npm が簡単です。
#   npm i -g @openai/codex
RUN npm install -g @openai/codex

USER shimada
# ----- coc.nvim を Vim の pack 機能で導入（release ブランチ）-----
# shimada の Vim ランタイムに配置
RUN mkdir -p ~/.vim/pack/colors/start \
	&& git clone --depth=1 https://github.com/cocopon/iceberg.vim \
		~/.vim/pack/colors/start/iceberg.vim \
	&& mkdir -p /home/shimada/.vim/pack/coc/start \
	&& git clone --branch release --depth=1 https://github.com/neoclide/coc.nvim \
		/home/shimada/.vim/pack/coc/start/coc.nvim \
	&& /usr/local/bin/vim -Nu NONE +"helptags /home/shimada/.vim/pack/coc/start/coc.nvim/doc" +q


# ----- Python -----
COPY --chown=shimada:shimada config/requirements.txt /home/shimada/requirements.txt
RUN python -m venv /home/shimada/.venv \
	&& . /home/shimada/.venv/bin/activate \
	&& pip install -r /home/shimada/requirements.txt

# ----- 各種設定ファイルのコピー -----
COPY --chown=shimada:shimada config/bashrc /home/shimada/.bashrc
COPY --chown=shimada:shimada config/vimrc /home/shimada/.vimrc
COPY --chown=shimada:shimada config/coc-settings.json /home/shimada/.vim/coc-settings.json
RUN mkdir /home/shimada/.codex
COPY --chown=shimada:shimada config/codex.config.toml /home/shimada/.codex/config.toml

WORKDIR /workspace
