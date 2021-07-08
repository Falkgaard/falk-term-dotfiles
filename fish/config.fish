# Fish:
	function fish_greeting
		printf "\n  \033[4;20;38;5;222;58;5;231mTerminal\033[0;1m: \"'Lo, guv!\"\n\n"
	end
	
	fish_vi_key_bindings
	
	# Colors:
		set fish_color_error          F55
		set fish_color_command        FFF --bold
		set fish_color_autosuggestion 777
		set fish_color_operator       FDA --bold
		set fish_color_quote          FCA
		set fish_color_end            FD8 --bold
		set fish_color_param          BBDDDD

# Editor:
	# if [[ -n $SSH_CONNECTION ]]; then
	# 	export EDITOR='vim'
	# else
		set -U EDITOR vim
	# fi

# Terminal Display Changes:
	# Note to others: Delete these functions
	function go_ext_2k --description 'Disable laptop monitor and set external monitor to 2K@60Hz'
		~/.config/bspwm/go_ext_2k.sh
	end
	
	function go_ext_4k --description 'Disable laptop monitor and set external monitor to 4K@30Hz'
		~/.config/bspwm/go_ext_4k.sh
	end
	
	function go_dual_2k --description 'Enable laptop monitor and set external monitor to 2K@60Hz'
		~/.config/bspwm/go_dual_2k.sh
	end
	
	function go_dual_4k --description 'Enable laptop monitor and set external monitor to 4K@30Hz'
		~/.config/bspwm/go_dual_4k.sh
	end
	
	function go_mobile --description 'Enable only laptop monitor.'
		~/.config/bspwm/go_mobile.sh
	end

# Starship Prompt:
	starship init fish | source

# Aliases:
	# Vim symmetry:
		alias :e $EDITOR
		alias :wq! "exit"
		alias :q! "exit"
		alias :wq "exit"
		alias :q "exit"
	# Show image (in KiTTy):
		alias show "kitty +kitten icat"
	# Font Installer:
		alias install-fonts "sudo mv ~/Downloads/fonts/* /usr/share/fonts ; fc-cache"
	# Fish:
		alias fishedit "nvim ~/.config/fish/config.fish"
		alias fishreload "source ~/.config/fish/config.fish"
	# User Safety:
		alias rm "rm -i"
		alias cp "cp -riv"
		alias mv "mv -iv"
		alias mkdir "mkdir -vp"
	# Find:
		alias f "find . -type f -regex "
	# pstree:
		alias pst "pstree -U | sed -e 's/[a-zA-Z][a-zA-Z0-9-]\+/\x1B[1;32m&\x1B[0m/g; s/[0-9]\+[*]/\x1B[1;31m&\x1B[0m/g; s/[{}]/\x1B[33m&\x1B[0m/g; y/└┬/┌┴/' | tac"
	# Tree:
		function pretty_tree --description 'Prettified tree'
			# if only one argument that's a number, assume it's the desired depth
			if string match -qr '^[0-9]+$' "$argv[1]"
				tree -L $argv -l -q -v --dirsfirst -C | sed -e 's/^/ /g; s/├── /├─● /g; s/└── /└─● /g; s/  / /g; s/  / /g'
			else
				tree $argv -l -q -v --dirsfirst -C | sed -e 's/^/ /g; s/├── /├─● /g; s/└── /└─● /g; s/  / /g; s/  / /g'
			end
		end
		
		alias t pretty_tree
	# LS:
		alias ll "ls -l"
		alias la "ls -A"
		alias lo "ls -o"
		alias lh "ls -lh"
		alias la "ls -la"
		alias sl "ls"
		alias l "ls -CF"
		alias s "ls"
	# Path:
		alias home "cd ~/"
		alias ... "../.."
		alias .... "../../.."
		alias ..... "../../../.."
	# Clear:
		alias cl "clear"
		alias cls "clear"
	# Make:
		#alias remake='make remake | grep -v "## *\|()"'
	# Git:
		alias gs "git status"
		alias gc "git commit"
		function gC # ssh clones repo in arg $1
		   git clone git@github.com:$1
		end
		# pulls, adds all files, commits (with optional message), then pushes
		# function gpacp
		#    local cmd="gp && ga . && gc "
		#    if [[ $# -ne 0 ]]; then
		#       cmd+="-m'"$1"' "
		#    end
		#    cmd+="&& gP"
		#    eval ${cmd}
		# end
		alias ga "git add"
		alias gd "git diff"
		alias gb "git branch"
		alias gl "git log"
		alias gP "git push"
		alias gp "git pull"
		alias gsb "git show-branch"
		alias gco "git checkout"
		alias gg "git grep"
		alias gk "gitk --all"
		alias gr "git rebase"
		alias gri "git rebase --interactive"
		alias gcp "git cherry-pick"
		alias grm "git rm"
	# Logs:
		#alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g'"
	# Programs:
		alias r "ranger"
		alias busy "cat /dev/urandom | hexdump -C | grep 'ca fe'"
		alias diskspace "du -S | sort -n -r | less"
		alias blender "prime-run blender"
		alias lc "lolcat"
	# Colour Support:
		# if [ -x /usr/bin/dircolors ]; then
		#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls "ls --color=auto --group-directories-first"
		alias lsd "ls -l -s -h"
		alias d "colorls -A --group-directories-first"
		alias cla 'clear; echo -ne "\e[3J"'
		alias dir "dir --color=auto"
		alias vdir "vdir --color=auto"
		alias grep "grep --color=auto"
		alias fgrep "fgrep --color=auto"
		alias egrep "egrep --color=auto"
		# end

# Misc:
	# Coloured GCC warnings and errors:
		set -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
		# TODO: does not seem to be add color to less...
		#       make less more friendly for non-text input files, see lesspipe(1)
		
		# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
		# add color in manpages for less:
		set -e LESS_TERMCAP_mb
		set -e LESS_TERMCAP_md
		set -e LESS_TERMCAP_me
		set -e LESS_TERMCAP_se
		set -e LESS_TERMCAP_so
		set -e LESS_TERMCAP_ue
		set -e LESS_TERMCAP_us
		
		set -Ux LESS_TERMCAP_mb \e\[0\x3B1\x3B31m
		set -Ux LESS_TERMCAP_md \e\[0\x3B1\x3B31m
		set -Ux LESS_TERMCAP_me \e\[0m
		set -Ux LESS_TERMCAP_se \e\[0m
		set -Ux LESS_TERMCAP_so \e\[0\x3B1\x3B44\x3B33m
		set -Ux LESS_TERMCAP_ue \e\[0m
		set -Ux LESS_TERMCAP_us \e\[0\x3B1\x3B32m

## Path Additions (TODO: remove)
#	export PYTHONPATH="${PYTHONPATH}:/home/falk/.local/bin"
#	export PATH=$HOME/bin:/usr/local/bin:$PATH
#	export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
#	export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
#	export PATH=$HOME/.local/bin:/sbin/:/usr/local/sbin:$PATH
#	# remove duplicate path entries
#	PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

# Scripts:
	# VPN:
		function vpn --description 'Valids args: country, disconnect|dc, reconnect|rc (+opt. country), status'
			if test (count $argv) -eq 0 -o "$argv[1]" = "status"
				nordvpn status | sed '1 i\ ' | sed -r "s/(.*:)/    "(tput setaf 254)"\1"(tput setaf 246)"/g; s/Connected/"(tput setaf 2)"Connected\!"(tput sgr0)"/; s/Disconnected/"(tput setaf 203)"Disconnected\!/"
			else if test "$argv[1]" = "reconnect" -o "$argv[1]" = "rc"
				nordvpn disconnect > /dev/null; printf "\nReconnecting...";
				if test (count $argv) -eq 2
					nordvpn connect ($argv[2])
				else
					nordvpn connect
				end
			else if test "$argv[1]" = "disconnect" -o "$argv[1]" = "dc"
				nordvpn disconnect | sed '1 i\ ' | sed '/^How/d' | sed "s/You are not connected to NordVPN/    "(tput setaf 245)"You are not connected/g; s/You are disconnected from NordVPN/    "(tput setaf 245)"You are disconnected/g"
			else
				nordvpn connect "$argv[1]"
			end
		end
		
		# Memory clear:
		function memclear --description 'Clears up memory'
			sudo pacman -Sc
			sudo pacman -Qdt
			sudo pacman -Rns (pacman -Qtdq)
			sudo journalctl --vacuum-size=50M
		end

# TODO
	
	# TODO: re-evaluate
	# export GTK_IM_MODULE=fcitx
	# export XMODIFIERS=@im=fcitx
	# export QT_IM_MODULE=fcitx
	
	## Kitty Auto Completion
	#	autoload -Uz compinit
	#	compinit
	#	kitty + complete setup zsh | source /dev/stdin
	
	##  TODO: Stuff to port over to fish from bash and zsh:
	#
	## Move & Link:
	#	function mvl() {
	#	   set -e
	#	   original="$1" target="$2"
	#	   if [ -d "$target" ]; then
	#	     target="$target/${original##*/}"
	#	   fi
	#	   mv -- "$original" "$target"
	#	   case "$original" in
	#	      */*)
	#	      case "$target" in
	#	         /*) :;;
	#	         *) target="$(cd -- "$(dirname -- "$target")" && pwd)/${target##*/}"
	#	      esac
	#	   esac
	#	   ln -s -- "$target" "$original"
	#	}
	#
	## PrintPath:
	#	printpath () {
	#	   printf "\e[1;38;5;222m%s\e[0m\n" "$(printf "    $PATH" | sed "s/:/\n    /g" | sort)"
	#	}
	#
	#
	## Up:
	#	# Move 'up' N directories
	#	up() {
	#	   cd $(eval printf '../'%.0s {1..$1}) && pwd;
	#	}
	#
	## Extract:
	#	extract () {
	#	   if [ -f $1 ] ; then
	#	      case $1 in
	#	         *.tar.bz2)   tar xvjf $1   ;;
	#	         *.tar.gz)    tar xvzf $1   ;;
	#	         *.bz2)       bunzip2 $1    ;;
	#	         *.rar)       unrar x $1    ;;
	#	         *.gz)        gunzip $1     ;;
	#	         *.tar)       tar xvf $1    ;;
	#	         *.tbz2)      tar xvjf $1   ;;
	#	         *.tgz)       tar xvzf $1   ;;
	#	         *.zip)       unzip $1      ;;
	#	         *.Z)         uncompress $1 ;;
	#	         *.7z)        7z x $1       ;;
	#	         *) echo "[ERROR] Unsupported format of file: '$1'..." ;;
	#	      esac
	#	   else
	#	      echo "'$1' is not a valid file!"
	#	   fi
	#	}
	#
	## Git:
	#	function gitpush() {
	#	  git add .; git commit -m "${1}"; git push
	#	}
	#	
	#	function gitpushf() {
	#	  git add .; git commit -m "${1}"; git push --force 
	#	}
	#
	## Translate:
	#	# Usage:   translate <phrase> <output-language> 
	#	# Example: translate "Bonjour! Ca va?" en 
	#	# See this for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
	#	function translate() {
	#	   wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}';
	#	}
	#
	## ccat:
	#	# Prints code files with syntax highlighting, step navigation, and line numbers
	#	ccat() {
	#	   pygmentize -f terminal -g -O linenos=1 $*
	#	}
	#	ccl() {
	#	   ccat $* | less -R
	#	}
	#
	## fawk:
	#	# Prints a word from a certain column of the output when piping.
	#	# Example: cat /path/to/file.txt | fawk 2 --> Print every 2nd word in each line.
	#	function fawk {
	#	   first="awk '{print "
	#	   last="}'"
	#	   cmd="${first}\$${1}${last}"
	#	   eval $cmd
	#	}
	#
	## Sort by size:
	#	sbs() {
	#	   du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"):    $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';
	#	}
	#
	## Task List [DISABLED]:
	##	TASKFILE="$HOME/.bashtask" # Hidden for neatness
	##	NC='\033[0m' # No Color
	##	LIGHTRED='\e[1;31m'
	##	LIGHTBLUE='\e[1;34m'
	##	if [ -f "$TASKFILE" ] && [ $(stat -c %s "$TASKFILE") != 0 ] # Check if file has content
	##	then
	##	    echo -e "${LIGHTRED}Task List${NC} as of ${LIGHTBLUE}$(date -r "$TASKFILE")${NC}"
	##	    echo ""
	##	    cat "$TASKFILE"
	##	    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
	##	else
	##	    echo "No tasks!"
	##	    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
	##	    touch "$TASKFILE"
	##	fi
	##	
	##	alias tasklist="bash"
	##	
	##	# Add a task
	##	function taskadd() {
	##	   echo "- $1" >> "$TASKFILE";
	##	} # Example: taskadd "Go grocery shopping"
	##	
	##	# Insert a task between two items
	##	function taskin() {
	##	   sed -i "$1i- $2" "$TASKFILE";
	##	} # Example: TODO
	##	
	##	# Remove a task
	##	function taskrm() {
	##	   sed -i "$1d" "$TASKFILE";
	##	} # Example: taskrm 2 --> Removes second item in list
	##	
	##	# Clears all tasks
	##	function taskclr() {
	##	   rm "$TASKFILE"; touch "$TASKFILE";
	##	}
	#
	## Conversion:
	#	# Converting audio and video files:
	#		function 2ogg  () { eyeD3 --remove-all-images "$1"; fname="${1%.*}"; sox "$1" "$fname.ogg" && rm "$1"; }
	#		function 2wav  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.wav" && rm "$1"; }
	#		function 2aif  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.aif" && rm "$1"; }
	#		function 2mp3  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mp3" && rm "$1"; }
	#		function 2mov  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mov" && rm "$1"; }
	#		function 2mp4  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mp4" && rm "$1"; }
	#		function 2avi  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.avi" && rm "$1"; }
	#		function 2webm () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" -c:v libvpx "$fname.webm" && rm "$1"; }
	#		function 2h265 () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" -c:v libx265 "$fname'_converted'.mp4" && rm "$1"; }
	#		function 2flv  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.flv" && rm "$1"; }
	#		function 2mpg  () { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mpg" && rm "$1"; }
	#	
	#	# Converting documents and images:
	#		function 2txt() { soffice --headless txt "$1"; }
	#		function 2pdf() {
	#		   if [ ${1: -4} == ".html" ]
	#		   then
	#		      fname="${1%.*}"
	#		      soffice --headless --convert-to odt "$1"
	#		      soffice --headless pdf "$fname.html"
	#		   else
	#		      soffice --headless pdf "$1"
	#		   fi
	#		}
	#		function 2doc() { soffice --headless doc "$1"; }
	#		function 2odt() { soffice --headless odt "$1"; }
	#		function 2jpeg() { fname="${1%.*}"; convert "$1" "$fname.jpg" && rm "$1"; }
	#		function 2jpg() { fname="${1%.*}"; convert "$1" "$fname.jpg" && rm "$1"; }
	#		function 2png() { fname="${1%.*}"; convert "$1" "$fname.png" && rm "$1"; }
	#		function 2bmp() { fname="${1%.*}"; convert "$1" "$fname.bmp" && rm "$1"; }
	#		function 2tiff() { fname="${1%.*}"; convert "$1" "$fname.tiff" && rm "$1"; }
	#		function 2gif() {
	#		   fname="${1%.*}"
	#		   if [ ! -d "/tmp/gif" ]; then mkdir "/tmp/gif"; fi
	#		   if [ ${1: -4} == ".mp4" ] || [ ${1: -4} == ".mov" ] || [ ${1: -4} == ".avi" ] || [ ${1: -4} == ".flv" ] || [ ${1: -4} == ".mpg" ] || [ ${1: -4} == ".webm" ]
	#		   then
	#		      ffmpeg -i "$1" -r 10 -vf 'scale=trunc(oh*a/2)*2:480' /tmp/gif/out%04d.png
	#		      convert -delay 1x10 "/tmp/gif/*.png" -fuzz 2% +dither -coalesce -layers OptimizeTransparency +map "$fname.gif"
	#		   else
	#		      convert "$1" "$fname.gif"
	#		      rm "$1"
	#		   fi
	#		   rm -r "/tmp/gif"
	#		}
	#		ai2svg() {
	#		   local d
	#		   local svg
	#		   for d in *.ai; do
	#		      d=$(echo "$(cd "$(dirname "$d")"; pwd)/$(basename "$d")")
	#		      svg=$(echo "$d" | sed 's/.ai/.svg/')
	#		      echo "Creating $svg ..."
	#		      inkscape -f "$d" -l "$svg"
	#		   done
	#		}
