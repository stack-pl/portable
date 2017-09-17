#!/bin/bash

git_branch_current() {
  echo "CURRENT BRANCH:"
  #git branch --points-at HEAD | \
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n')
  echo "* $CURRENT_BRANCH"
  echo ""
}

git_branch_list() {
  echo "BRANCHES:"
  git branch
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n')
  echo
}

git_status() {
  STATUS=$(git status -s -uall)
  #IS_CHANGED=$(echo "$STATUS" | wc -l)
  echo "$STATUS"
}

git_status_tracked() {
  if [ `echo "$1" | grep ^[^?!][^?!] | wc -l` -gt 0 ]
  then
    echo "       Changes in tracked files:"
    echo "+---------+---------+------------------"
    echo "| Staged  |Unstaged |  File name"
    echo "+---------+---------+------------------"
    echo "$1" \
    | grep ^[^?!][^?!] \
    | sed -r 's/(.)(.)\s*(.+)/|    \1    |    \2    | \3/'
    echo "+---------+---------+------------------"
    echo ""
  fi
}

git_status_untracked() {
  if [ `echo "$1" | grep ^[?][?] | wc -l` -gt 0 ]
  then
    echo "+---------------------"
    echo "|  Untracked files (use \"git add\" or update \".gitignore\")"
    echo "+---------------------"
    echo "$1" | \
    grep ^[?][?] | \
    sed -r 's/[?][?]\s*(.+)/| \1/'
    echo ""
  fi
}

git_diff_stat() {
  git diff --stat --color 2>&1
  echo ""
}

git_flow_help() {
  W=$(tput setaf 7; tput sgr0;)
  #W=$(echo "\033[m")
  G=$(tput setaf 2;tput bold)
  Y=$(tput setaf 3;tput bold)

  split_slash $CURRENT_BRANCH
  echo "git-flow:"
  if [ $(echo "$RP1" | grep master | wc -l) -gt 0 ]
  then
    echo "${W}--------------  git-flow helper:  --------------
A. Start a hotfix. New branch will be created from the
   corresponding tag on the 'master' branch that
   marks the production version. The <VERSION> argument
   hereby marks the new hotfix release name:
   ${Y}  $ git flow hotfix start <VERSION> ${W}
   or optionally you can specify a basename to start from:
   ${Y}  $ git flow hotfix start <VERSION> <basename> ${W}
B. Finish a hotfix. By finishing a hotfix it gets merged
   back into 'develop' and 'master'. Additionally
   the 'master' merge is tagged with the hotfix version.
   ${Y}  $ git flow hotfix finish <VERSION> ${W}
------------------------------------------------"
  fi

  if [ $(echo "$RP1" | grep develop | wc -l) -gt 0 ]
  then
    echo "${W}--------------  git-flow helper:  --------------
A. Start developing a new feature. This creates a new
   feature branch based on 'develop' and switches to it.
   ${G}  $ git flow feature start <feature-name>${W}
B. Start a release. It creates a release branch created 
   from the 'develop' and switches to it:
   ${Y}  $ git flow release start <release-name>${W} 
   or optionally supply a commit sha-1 hash to start
   the release from:
   ${Y}  $ git flow release start <release-name> <sha1> ${W}
------------------------------------------------"
  fi  

  if [ $(echo "$RP1" | grep feature | wc -l) -gt 0 ]
  then
    echo "${W}--------------  git-flow helper:  --------------
1. Finish up a feature:
   ${G}  $ git flow feature finish $RP2 ${W}
2. Publish a feature to the remote server, if you
   developing a feature in collaboration:
   ${Y}  $ git flow feature publish $RP2 ${W}
3. Get a feature published by another user:
   ${Y}  $ git flow feature pull origin $RP2 ${W}
4. Track a feature on origin:
   ${Y}  $ git flow feature track $RP2 ${W}
------------------------------------------------"
  fi  

   if [ $(echo "$RP1" | grep release | wc -l) -gt 0 ]
  then
    echo "${W}--------------  git-flow helper:  --------------
1. Publish the release branch after creating it
   to allow release commits by other developers:
   ${Y}  $ git flow release publish $RP2 ${W}
2. Track a remote release:
   ${Y}  $ git flow release track $RP2 ${W}
3. Finish up a release. It performs several actions:
   -merges the release branch back into 'master',
   -tags the release with its name ($RP2),
   -back-merges the release into 'develop',
   -removes the release branch.
   ${G}  $ git flow release finish $RP2 ${W}
4. Push your tags with:
   ${G}  $ git push --tags ${W}
------------------------------------------------"
  fi 

  if [ $(echo "$RP1" | grep hotfix | wc -l) -gt 0 ] 
  then
    echo "${W}--------------  git-flow helper:  --------------
1. Finish a hotfix. By finishing a hotfix it
   gets merged back into 'develop' and 'master'.
   Additionally the 'master' merge is tagged
   with the hotfix version:
   ${G}  $ git flow hotfix finish <VERSION> ${W} 
------------------------------------------------"
  fi 

  if [ $(echo "$RP1" | grep support | wc -l) -gt 0 ]
  then
    echo ""
  fi
}

split_slash() {
  RP1=$(echo "$1" | sed -r 's#(^[^/]+)\/(.+)#\1#') 
  RP2=$(echo "$1" | sed -r 's#(^[^/]+)\/(.+)#\2#')
}

git_log() {
  git log --all --graph --decorate --oneline -n 25 --color 2>&1
#\
#  | sed -e "s/\x31\x68\x1B\x3D\x0D//;s/\x31\x6C\x1B\x3E//" \
 # | cat ;
}

git_init() {
  git init
}

GitFlow() {
  tput cup $SCREEN_LINES 0
  git_flow_help
}

isgitflow() {
  if [ $(cat ./.git/config 2>/dev/null | grep "^\[gitflow" | wc -l) -gt 0 ]
  then
    GITFLOW=1
    :
  else
    GITFLOW=0
    :
  fi
}

menu() {
  local arrow_up=" "
  local arrow_down=" "
  local W=$(tput sgr0;)
  local Y=$(tput setaf 3; tput setab 0; tput bold;)
  local C=$(tput setaf 3; tput setab 1; tput bold;)

  if [[ FIRST_LINE -gt 1 && EOF_LINE -gt LAST_LINE ]] ; then
    echo -en "\u2195 "
  else
    if [[ FIRST_LINE -gt 1 ]] ; then
      echo -en "\u2191 " #"25B2"
    #else
    #  echo -en " "
    fi
    if [[ EOF_LINE -gt LAST_LINE ]] ; then
      echo -en "\u2193 " #"25BC"
    #else
    #  echo -en " "
    fi
  fi


  if [[ IS_REPO -eq 0 ]] ; then
    echo -en "${Y}F2${C}Init   "
    echo -en "${Y}F3${C}        "
    echo -en "${Y}F4${C}        "
    echo -en "${Y}F5${C}        "
    echo -en "${Y}F6${C}        "
    echo -en "${Y}F7${C}        "
    echo -en "${Y}F8${C}        "
    echo -en "${Y}F9${C}        "
  else
    if [[ IS_CHANGED -eq 0 ]] ; then
      echo -en "${Y}F2${C}       "
    else
      echo -en "${Y}F2${C}Status "
    fi

    echo -en "${Y}F3${C}Add     "
    echo -en "${Y}F4${C}Commit  "
    echo -en "${Y}F5${C}MergRbse"
    echo -en "${Y}F6${C}PullFtch"

    if [[ IS_CHANGED -eq 0 ]] ; then
      echo -en "${Y}F7${C}Push    "
    else
      echo -en "${Y}F7${C}        "
    fi

    if [[ IS_ANY_BRANCH -eq 0 ]] ; then
      echo -en "${Y}F8${C}        "
    else
      echo -en "${Y}F8${C}LogReflg"
    fi

    if [[ IS_GITFLOW -eq 0 ]] ; then
      echo -en "${Y}F9${C}        "
    else
      echo -en "${Y}F9${C}GitFlow"
    fi
  fi

  echo -en "${W}"

 # echo -e "$arrow_up$arrow_down ${Y}"\
 # "2${C}Status  ${Y}"\
 # "3${C}AddRemov${Y}"\
 # "4${C}Commit  ${Y}"\
 # "5${C}MergRbas${Y}"\
 # "6${C}PullFtch${Y}"\
 # "7${C}Push    ${Y}"\
 # "8${C}LogReflg${Y}"\
 # "9${C}Git-Flow${Y}"\
 # "${W}"
}

# TODO: remove function, move body into main loop
main() {
echo "$MODE"

  #if [ $(echo "$STATUS" | wc -w) -gt 0 ]
  if [[ IS_REPO -eq 0 ]] ; then
    echo "No repository found here."
    echo "Sugestion: Press F2 to initialize Git repository here"
    tput cup $SCREEN_LINES 0
  else
    STATUS=$(git_status)
    GITBRANCH=$(git branch)
    if [ $IS_CHANGED -gt 0 ] ; then
      git_branch_current
      git_status_tracked "$STATUS"
      git_diff_stat
      git_status_untracked "$STATUS"
      tput cup $SCREEN_LINES 0
    else
      git_branch_list
      isgitflow
      if [ $GITFLOW -gt 0 ]
      then
        git_flow_help
      fi
      git_log
      tput cup $SCREEN_LINES 0
    fi

  fi
}

# start mode
MODE="main"

BEG_LINE_NUMBER=1
END_LINE_NUMBER=$LINES

FIRST_LINE=1
MAX_LINE=$(tput lines)
(( MAX_LINE = MAX_LINE - 1 ))
(( SCREEN_LINES = MAX_LINE - 2 ))
EOF_LINE=1

FIRST_COL=1
MAX_COLS=$(tput cols)
#(( SCREEN_COLS = MAX_COLS - 2 ))
#(( LAST_COL = FIRST_COL + SCREEN_COLS ))

OLD_CONTENT_DIGEST=""


# Reset terminal to current state when we exit.
trap "stty $(stty -g)" EXIT

# Disable echo and special characters, set input timeout to 0.2 seconds.
stty -echo -icanon time 2 || exit $?

# String containing all keypresses.
KEYS=""

UPDATE_COUNTER=""

# Set field separator to BEL (should not occur in keypresses)
IFS=$'\a'

# Remind user to press ESC to quit.
echo "Press Esc to quit." >&2

# Input loop.
while [ 1 ]; do

    # Read more input from keyboard when necessary.
    while read -t 0
    do
        read -s -r -d "" -N 1 -t 0.1 CHAR && KEYS="$KEYS$CHAR" || break
    done

    # If no keys to process, wait 0.05 seconds and retry.
    if [ -z "$KEYS" ]; then
        sleep 0.01
        #continue
    fi

    # Check the first (next) keypress in the buffer.
    case "$KEYS" in
      $'\x1B\x5B\x41'*) # Up
        KEYS="${KEYS##???}"
        if [[ FIRST_LINE -gt 1 ]]
        then
          (( FIRST_LINE = FIRST_LINE - 1 ))
          # force to update screen
          UPDATE=""
          # do not do main job after each key pressed
          MAIN_JOB=0
        fi
        ;;
      $'\x1B\x5B\x42'*) # Down
        KEYS="${KEYS##???}"
        if [[ EOF_LINE -gt LAST_LINE ]]
        then
           (( FIRST_LINE = FIRST_LINE + 1 ))
          # force to update screen
          UPDATE=""
          # do not do main job after each key pressed
          MAIN_JOB=0
        fi
        ;;
      $'\x1B\x5B\x44'*) # Left
        KEYS="${KEYS##???}"
        echo "Left"
        ;;
      $'\x1B\x5B\x43'*) # Right
        KEYS="${KEYS##???}"
        echo "Right"
        ;;
      $'\x1B\x4F\x48'*) # Home
        KEYS="${KEYS##???}"
        FIRST_LINE=1
        UPDATE=""
        ;;
      $'\x1B\x5B\x31\x7E'*) # Home (Numpad)
        KEYS="${KEYS##????}"
        FIRST_LINE=1
        UPDATE=""
        ;;
      $'\x1B\x4F\x46'*) # End
        KEYS="${KEYS##???}"
        echo "End"
        ;;
      $'\x1B\x5B\x34\x7E'*) # End (Numpad)
        KEYS="${KEYS##????}"
        echo "End (Numpad)"
        ;;
      $'\x1B\x5B\x45'*) # 5 (Numpad)
        KEYS="${KEYS#???}"
        echo "Center (Numpad)"
        ;;
      $'\x1B\x5B\x35\x7e'*) # PageUp
        KEYS="${KEYS##????}"
        for (( x=1; x < SCREEN_LINES; x += 1 ))
        do
          (( LAST_LINE = FIRST_LINE + SCREEN_LINES )) 
          if [[ FIRST_LINE -gt 1 ]]
          then
            (( FIRST_LINE = FIRST_LINE - 1 ))
          fi
        done
        UPDATE=""
        # do not do main job after each key pressed
        MAIN_JOB=0
        ;;
      $'\x1B\x5B\x36\x7e'*) # PageDown
        KEYS="${KEYS##????}"
        for (( x=1; x < SCREEN_LINES; x += 1 ))
        do
          (( LAST_LINE = FIRST_LINE + SCREEN_LINES )) 
          if [[ EOF_LINE -gt LAST_LINE ]]
          then
            (( FIRST_LINE = FIRST_LINE + 1 ))
          fi
        done
        UPDATE=""
        # do not do main job after each key pressed
        MAIN_JOB=0
        ;;
      $'\x1B\x5B\x32\x7e'*) # Insert
        KEYS="${KEYS##????}"
        echo "Insert"
        ;;
      $'\x1B\x5B\x33\x7e'*) # Delete
        KEYS="${KEYS##????}"
        echo "Delete"
        ;;
      $'\n'*|$'\r'*) # Enter/Return
        KEYS="${KEYS##?}"
        echo "Enter or Return"
        ;;
      $'\t'*) # Tab
        KEYS="${KEYS##?}"
        echo "Tab"
        ;;
      $'\x1B') # Esc (without anything following!)
        KEYS="${KEYS##?}"
        echo "Esc - Quitting"
        exit 0
        ;;
     'q') 
        KEYS="${KEYS##?}"
        exit 0
        ;;
     'Q')
        KEYS="${KEYS##?}"
        exit 0
        ;;
      $'\x1B\x4F\x51'*) # F2
        echo "F2"
        KEYS=""
        if [[ IS_REPO -eq 0 ]] ; then
          git init
        fi
        ;;
      $'\x1B\x5B\x32\x30\x7E'*) # F9
        KEYS=""
        if [ "$MODE" == "main" ] ; then
        echo "switch to GitFlow mode"
            MODE="GitFlow"
          if [[ IS_GITFLOW -eq 1 ]] ; then

            tput cup $SCREEN_LINES 0
            git_flow_help
          fi
        else
          MODE="main"
          echo "switch to main mode"
        fi
        ;;
      $'\x1B'*) # Unknown escape sequences
        echo -n "Unknown escape sequence (${#KEYS} chars): \$'"
        echo -n "$KEYS" | od --width=256 -t x1 | sed -e '2,99 d; s|^[0-9A-Fa-f]* ||; s| |\\x|g; s|$|'"'|"
        KEYS=""
        ;;
      [$'\x01'-$'\x1F'$'\x7F']*) # Consume control characters
        KEYS="${KEYS##?}"
        ;;
      $'') # None key was pressed
        UPDATE="$UPDATE*"
        if [ "$UPDATE" == "**********" ]
        then
          UPDATE=""
          MAIN_JOB=1
        else
          continue
        fi
        ;;
      $' ') # Space
        KEYS="${KEYS##?}"
        # the same as "page down"
        for (( x=1; x < SCREEN_LINES; x += 1 ))
        do
          (( LAST_LINE = FIRST_LINE + SCREEN_LINES ))
          if [[ EOF_LINE -gt LAST_LINE ]]
          then
            (( FIRST_LINE = FIRST_LINE + 1 ))
          fi
        done
        UPDATE=""
        ;;
      *) # Printable characters.
        KEY="${KEYS:0:1}"
        KEYS="${KEYS#?}"
        echo "'$KEY'"
        ;;
    esac

    # do main job below if $UPDATE is empty string
    if [ -n "$UPDATE" ]
    then
        sleep 0.05
        continue
    fi

# current mode for main loop
STATE="AUTO"

# recognize state of repo:
IS_REPO=0
IS_ANY_BRANCH=0
IS_CHANGED=0
IS_ANY_STASH=0
IS_CONFLICT=0
IS_REMOTE=0
IS_GITFLOW=0
IS_GITFLOW_REPO=0
if [ $(git status 2>&1 | grep "Not a git repository" | wc -l) -eq 0 ] ; then
  IS_REPO=1
  if [ $(git branch 2>/dev/null | wc -l) -gt 0 ] ; then
    IS_ANY_BRANCH=1
    if [ $(git status -s -uall 2>/dev/null | wc -l) -gt 0 ] ; then
      IS_CHANGED=1
    fi
  fi

  if [ $(git stash list 2>/dev/null | wc -l) -gt 0 ] ; then
    IS_ANY_STASH=1
  fi

  if [ $(git ls-files --unmerged 2>/dev/null | wc -l) -gt 0 ] ; then
    IS_CONFLICT=1
  fi

  if [ $(git flow 2>&1 | grep "is not a git command" | wc -l) -eq 0 ] ; then
    IS_GITFLOW=1
    if [ $(git flow log 2>&1 | grep "Not a gitflow-enabled" | wc -l) -eq 0 ] ; then
      IS_GITFLOW_REPO=1
    fi    
  fi
fi 

if [[ MAIN_JOB -eq 1 ]] ; then
  # main job

  if [ "$MODE" == "main" ] ; then
    OUT=$(main)
  fi
  if [ "$MODE" == "GitFlow" ] ; then
    OUT=$(GitFlow)
  fi
fi

  #FIRST_LINE=1
  #LAST_LINE=$((L - 1))

  # get current number of lines in the terminal
  MAX_LINE=$(tput lines)
  (( MAX_LINE = MAX_LINE - 1 ))
  (( SCREEN_LINES = MAX_LINE - 2 ))
  (( LAST_LINE = FIRST_LINE + SCREEN_LINES ))

  # get current number of columns in the terminal
  MAX_COLS=$(tput cols)
  #(( SCREEN_COLS = MAX_COLS - 2 ))
  #(( LAST_COL = FIRST_COL + SCREEN_COLS ))

  # calculate number of lines 
  EOF_LINE=$(echo "$OUT" | wc -l) 
  
  # fix view if something happened
  if [ $LAST_LINE -gt $EOF_LINE ]
  then
    FIRST_LINE=1
    (( LAST_LINE = FIRST_LINE + SCREEN_LINES ))
  fi

  # print lines in range (FIRST_LINE, LAST_LINE)
  #echo "$OUT" | sed -ne "${FIRST_LINE},${LAST_LINE}p;${LAST_LINE}q"
  CONTENT=$(echo "$OUT" | awk "NR < $FIRST_LINE {next}; NR == $LAST_LINE {print;exit}; {print};") 
  NEW_CONTENT_DIGEST=$(echo "$CONTENT:$FIRST_LINE:$MAX_LINE:$MAX_COLS" | md5sum)
  if [ "$NEW_CONTENT_DIGEST" != "$OLD_CONTENT_DIGEST" ]
  then
    OLD_CONTENT_DIGEST=$NEW_CONTENT_DIGEST
    tput rmam
    clear
    echo "$CONTENT"
    menu
    #echo $IS_REPO$IS_ANY_BRANCH$IS_CHANGED
    tput smam
  fi

done
