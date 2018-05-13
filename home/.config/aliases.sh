#####################
##### auto_mount ####
#####################
function get_mount {
	mnt=`grep "$1" /proc/mounts | cut -d ' ' -f 2`
	echo ${mnt/"\040"/" "}
}

function auto_mount {
	udisksctl mount -b /dev/$1 &> /dev/null
	disk=`echo $1 | grep -Eo "([A-Za-z_-]+)"`
	mnt_name=`get_mount $1`
	hash -d $disk="$mnt_name"
	cd ~$disk
}

function check_mounts {
	for x in {b..c}; do
		for i in {1..3}; do
			name=sd$x$i
			auto_mount $name
			cd
			hash -d $name="`get_mount $name`"
			alias $name="auto_mount $name"
		done
		name=sd$x
		if [[ `grep -c "sd$x" /proc/mounts` -eq 1 ]]; then
			name=`grep "sd$x" /proc/mounts | cut -d ' ' -f 1 | cut -d '/' -f 3`
			echo ~sd$x=$(get_mount sd$x)
			hash -d sd$x="$(get_mount sd$x)"
			alias sd$x="auto_mount sd$x"
		fi
	done	
}


### other

alias sudo='sudo -E'

alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias lip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias py='sudo ipython'

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

alias countfiles='ls -l */* | grep ^- | wc -l'

if [ -z "$EDITOR" ]; then
	export EDITOR='nvim'
	export VISUAL='nvim'
fi

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

alias run='nocorrect ~/skillz/game/run.sh'
alias music-dl='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0'
alias _=sudo

function count_sec_audio {
	EPOCH='jan 1 1970'
	sum=0
	times=`eyeD3 * | grep Time | awk '{ print $2 }'`

	for i in $times; do
  		sum="$(date -u -d "$EPOCH $i" +%s) + $sum"
	done
	echo $sum|bc
}

alias inst='_ apt install -y'
alias updt='_ apt upgrade -y'
alias rmv='_ apt purge -y'

export FrameworkPathOverride=/usr/lib/mono/4.5/
export PATH=$PATH:$HOME/.local/bin
