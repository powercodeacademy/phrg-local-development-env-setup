#!/bin/bash

export PATH=/usr/local/bin:$PATH

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# If not running interactively, don't do anything
if [ -n "$PS1" ]; then

  # Source global definitions
  if [ -f /etc/bashrc ]; then
    . /etc/bashrc
  fi

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
  fi

  # Lets define some pretty colors
  BLACK='\033[30m'
  RED='\033[31m'
  GREEN='\033[32m'
  YELLOW='\033[33m'
  BLUE='\033[34m'
  MAGENTA='\033[35m'
  CYAN='\033[36m'
  WHITE='\033[37m'

  BGBLACK='\033[40m'
  BGRED='\033[41m'
  BGGREEN='\033[42m'
  BGYELLOW='\033[43m'
  BGBLUE='\033[44m'
  BGMAGENTA='\033[45m'
  BGCYAN='\033[46m'
  BGWHITE='\033[47m'

  BRIGHT='\033[01m'
  NORMAL='\033[00m'

  ITALIC='\033[03m'
  UNDERSCORE='\033[04m'  # only works in xterms
  BLINK='\033[05m'     # doesn't work in xterms
  REVERSE='\033[07m'
  INVISIBLE='\033[08m'
  # \033[x;yH Moves cursor to x,y
  # \033[yA Moves cursor up y lines
  # \033[yB Moves cursor down y lines
  # \033[xC moves cursor right x spaces
  # \033[xD moves cursor left x spaces
  CLEAR='\033[2J'

  # Other nice escape sequences:
  # Set xterm (or compatible) titlebar:
  # \033]0;foo\007 (replace "foo")
  # Set Konsole/iTerm tab name:
  # \033]30;foo\007 (replace "foo")
  # Set Konsole (KDE 3.5+) tab color:
  # \033[28;RGBt (replace RGB with the color hex value in decimal form)
  #
  # man bash "PROMPTING" to see escape chars that bash will expand (ex. \u or \h)

  # Don't forget to surround any escape sequences in PS1 with '[' and ']'
  # This allows bash to properly calculate line length

  (echo $PATH | egrep '::|:\.|\.:|:$' > /dev/null) &&
    printf "${BRIGHT}${RED}${BGWHITE}WARNING: \".\" is in your PATH.${NORMAL}\n" >&2

  # Color used by all hosts on this network
  USERCOLOR=$BRIGHT$WHITE

  # Find out which terminal device we are on
  GITBRANCH=\$\("git rev-parse --abbrev-ref HEAD 2>/dev/null"\)

  # Prepare the titlebar string if we happen to be on an xterm (or a derivative).
  case $TERM in
    xterm*|screen|cygwin)
      TITLEBAR='\[\033]0;$(basename `pwd`)\007\]'

      # Set the screen window title if we are in screen
      if [ "$TERM" == "screen" ]; then
        TABNAME="${TABNAME}"'\[\033k'"$(basename `pwd`)"'\033\\\]'
      fi
      ;;
    *)
      TITLEBAR=''
      TABNAME=''
      TABCOLOR=''
      ;;
  esac

  # Prints "[Last command returned error X]" where X is the return code of the
  # last executed program when not 0
  PRINTErrCode="\$(returnval=\$?
    if [ \$returnval -ne 0 ]; then
      echo \"\\n\[${BRIGHT}${WHITE}[${RED}\]Last command returned error \$returnval\[${WHITE}\]]\"
    fi)"

  # Strip leading and trailing white space (new line inclusive).
  trim(){
      [[ "$1" =~ [^[:space:]](.*[^[:space:]])? ]]
      printf "%s" "$BASH_REMATCH"
  }

  RUBYSTRING="$(trim $(asdf list ruby))"

  # Prints "host: /path/to/cwd (terminal device)" properly colorized for the
  # current network. "user" is printed as red if EUID=0
  TOPLINE="\[${NORMAL}\]\n\$([ 0 == \$EUID ] && echo \[${BRIGHT}${RED}\] || echo \[${USERCOLOR}\])\u\[${NORMAL}${USERCOLOR}\]: \w\[${NORMAL}\] (${NORMAL}${RED}${RUBYSTRING:-null}${NORMAL}) ${BRIGHT}${BLUE}${GITBRANCH}${NORMAL}\n"

  # Prints "[date time]$ " substituting the current date and time.  "$" will print
  # as a red "#" when EUID=0
  BOTTOMLINE="[\d \t]\$([ 0 == \$EUID ] && echo \[${BRIGHT}${RED}\] || echo \[${USERCOLOR}\])\\\$\[${NORMAL}\] "

  # Colorize the prompt and set the xterm titlebar too
  PS1="${PRINTErrCode}${TITLEBAR}${TOPLINE}${BOTTOMLINE}"

  ###
  # ls colors
  ###
  # The colors defined below should map as:
  # directories: bright white over blue
  # symlinks: bright cyan
  # sockets: bright magenta
  # pipes: bright brown (yellow)
  # executables: bright green
  # block specials: bright brown (yellow)
  # char specials: bright brown (yellow)
  # BSD ONLY: SETUID: bright white over red
  # BSD ONLY: SETGID: bright white over brown (orange)
  # BSD ONLY: "tmp" dirs (world writeable + sticky): black over grey
  # BSD ONLY: world writeable dirs: red over grey

  # Set the colors used by ls.  Useful for dark displays like putty.
  LS_COLORS='no=00:fi=00:di=37;44:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:';

  # For BSD ls
  LSCOLORS="HeGxFxDxCxDxDxHBHdehBh"

  ###
  # Environment customization
  ###
  LS=`which ls`
  # Set distribution-specific options
  $LS -N / > /dev/null 2>&1
  if [ $? == 0 ]; then
    # Hopefully we've got the GNU version
    LS_OPTIONS="-N --color=tty -T 0 -p"
  elif [ "`uname -s`" == "Darwin" ]; then
    # -G: show colors
    # -p: show file type icons in ls output
    # -o: show flags when used with -l
    LS_OPTIONS="-G -p -O"
    alias top='top -ocpu -s3'
  else
    # FIXME: Add test for *BSD and add -o at least
    LS_OPTIONS=""
  fi

  # Make sure we have defined a temporary directory
  [ -z "$TMPDIR" ] && export TMPDIR=/tmp

  # Some standard aliases
  alias +='pushd .'
  alias -- -='popd'
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ls="$LS $LS_OPTIONS"

  # If we have a recent version of GNU grep colorize the output
  grep --version|grep GNU >/dev/null 2>&1
  if [ $? -eq 0 ]; then
      alias grep="grep --color=auto"
  fi

  # And save all those wonderful settings from above
  export PS1 LS_COLORS LSCOLORS
  export EDITOR='subl -n -w'

  # vi mode must come *BEFORE* any additional keybindings
  # Keep that neat functionality from emacs mode where CTRL-L clears the screen
  bind "\C-l":clear-screen
  # Bind ^E to FCEDIT
  bind "\C-e":edit-and-execute-command

  # Eastern Time Zone
  export TZ="America/New_York"
  # POSIX C (English)
  export LANG=C

  # Support for Heroku Toolbelt
  heroku_toolbelt="/usr/local/heroku/bin"
  if [ -d $heroku_toolbelt ]; then
    PATH="$PATH:$heroku_toolbelt"
  fi

  # iTerm2 integration: https://iterm2.com/documentation-shell-integration.html
  iterm2_integration_path="$HOME/.iterm2_shell_integration.`basename $SHELL`"
  if [ -r $iterm2_integration_path ]; then
    source $iterm2_integration_path
  fi

  # Case-Insensitive Auto Completion
  bind "set completion-ignore-case on"

  # And finally, remind me which host and OS I'm logged into.
  printf "${BRIGHT}${WHITE}$HOSTNAME `uname -rs`${NORMAL} ${USERCOLOR} ${NORMAL}\n" >&2

fi # Test for non-interactive shells

export GPG_TTY=$(tty)
