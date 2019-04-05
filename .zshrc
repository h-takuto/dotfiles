# (d) is default on

# ------------------------------
# General Settings
# ------------------------------

export EDITOR=vim        # エディタをvimに設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
export LANG=ja_JP.UTF-8
export XDG_CONFIG_HOME=~/.config

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)

# auto ls
case ${OSTYPE} in
  darwin*)
    export CLICOLOR=1
    function chpwd() {ls -G -F}
    ;;
  linux*)
    function chpwd() { ls -F --color=auto }
    ;;
esac


### Complement (補完関連) ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完時の色の設定
if [ -n "$LS_COLORS" ]; then
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
#補完リストをグループ分け
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:default' menu select=2
#zstyle ':completion:*:warnings' format 'No matches for: %d'

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt EXTENDED_HISTORY   #開始と終了を記録
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
#setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する

function history-all { history -E 1 } #全経歴を一覧で表示する

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
# よくわからないので変更なし

# 補完時の色の設定
if [ -n "$LS_COLORS" ]; then
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

### screen ###
#setopt prompt_subst
#RPROMPT='%{${fg[green]}%}%/%{$reset_color%}'
#common_precmd() {
#  LANG=en_US.UTF-8 vcs_info
#  LOADAVG=$(sysctl -n vm.loadavg | perl -anpe '$_=$F[1]')
#  PROMPT='${vcs_info_msg_0_}%{${fg[yellow]}%}%* ($LOADAVG) %%%{$reset_color%} '
#}
case "${TERM}" in screen)
    preexec() {
      echo -ne "\ek#${1%% *}\e\\"
    }
    precmd() {
      echo -ne "\ek$(basename $(pwd))\e\\"
    }
esac


# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# ------------------------------
# Other Settings
# ------------------------------

### Aliases (共通) ###
alias rmrf='rm -r -f'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias -s py=python
alias -s php=php
alias -s rb=ruby
alias ps='ps aux'
alias hisa='history-all'

### git Aliases ###
#alias gco="git checkout"
#alias gbr="git branch"
#alias gba="git branch -a"
#alias gcm="git commit"
#alias gst="git status"

case ${OSTYPE} in
	darwin*)
		#Mac用の設定
		export CLICOLOR=1
		alias ls='ls -G -F'
		alias la='ls -a'
    alias xcode='open -n /Applications/Xcode.app'
		#日本語ファイル名を表示可能にする
		setopt print_eight_bit
		;;
	linux*)
		#linux用の設定
		alias la='ls -a --color'
		alias ls='ls --color'
		;;
esac
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	export WORKON_HOME=$HOME/.virtualenvs
	source `which virtualenvwrapper.sh`
fi

#.alias読み込み;
if [ -f ~/.alias ]; then
	source ~/.alias
fi

#.bash_profile読み込み
if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

if [ -f ~/bin/cpplint.py ]; then
    export PATH=$PATH:~/bin
fi

# go言語のパスの設定
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/MyLibrary/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/thayakawa/MyLibrary/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/thayakawa/MyLibrary/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/thayakawa/MyLibrary/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/thayakawa/MyLibrary/google-cloud-sdk/completion.zsh.inc'
fi
