# These are some example functions, taken from my own mail routines and setup.
#
# I use [afew](https://github.com/afewmail/afew) to keep my Maildir directories
# synced with my notmuch tags -- so if something is tagged "inbox" it stays in
# my INBOX Maildir, but if something is in my INBOX and tagged "archive" it
# gets moved into an archive folder. Similarly, mail marked "spam" get moved to
# a spam folder.
#
# This code is designed for zsh, but should work for any POSIX shell. Zsh does
# not split variables on the command line by default, so there are a few evals
# in this to force parsing to be the same in zsh and other shells.


mid() {
    mhdr -h Message-Id $* | sed -e 's/"/""/g' -e 's/^</id:"/g' -e 's/>$/"/g'
}

mnm () {
    # mnm - mblaze notmuch
    # search and return a list of files, suitable for mblaze functions
    # This is the same as mblaze's msearch in its contrib directory.
    notmuch search --output=files $*
}

mrev () {
    msort ${*:--r} | sponge | mseq -S
}

minbox () {
    # minbox - mblaze my inbox
    # find everything in the notmuch "inbox", and store it in the default sequence
    notmuch search --output=files tag:inbox | msort -r -d -U | mseq -S
}

mtoday () {
    # mtoday - focus on today's email (I have a broad view of 'today')
    notmuch search --output=files "tag:inbox AND ( date:today OR date:yesterday )" | msort -r -d -U | mseq -S
}

mflag () {
    # mflag - toggle 'important' flag
    mbatchtag "awk '/+flagged/ { sub(/+flagged/,\"-flagged\"); print; next}; !/+flagged/ { printf \"+flagged \";print; next }' " $*
}

mspam () {
    # mark as spam (mails tagged spam get moved out of my Maildir Inbox into a spam folder by a utility called afew)
    mbatchtag "sed 's/+inbox/-inbox +spam +missedspam/'" $*
}

march () {
    # mark as archived (mails tagged archive get moved out of my Maildir Inbox by a utility called afew)
    mbatchtag "sed 's/+inbox/-inbox +archive/'" $*
}

mt () {
    # find all in same thread as this email
    # uses notmuch's threading knowledge, not mblaze's
    mnm `notmuch search --output=threads $(mseq ${*:-.} | mid)`
}

msf () {
    # fix missing files in the standard sequence
    mseq -f | mseq -S
}

mbatchtag () {
    action=$1
    shift
    if [ -t 0 ]; then
        # we don't want to accidentally action all the things if don't give another argument
        mtags -t ${*:-.} | eval $action | notmuch tag --batch
    else
        mtags -t | eval $action | notmuch tag --batch
    fi
}

# mblaze filters -- choose an action from a set of filters

mflist () {
    # mflist - list all our filters, with a count of how many mails have been found
    while read -u9 -n line ; do
        command=`echo $line| sed 's/#.*$//'`
        echo -n $command "# "
        $command | wc -l
    done 9<<EOF
magrep "Precedence:bulk"         # mass mails
magrep "broadcastSendId:.*"      # mass mails
magrep "Feedback-ID:.*"          # mass mails
EOF
}

mfpick () {
    # mfpick use pick(1) to select a filter, and optional do something with it
    # default action is "mscan" to list the filter
    command2=`mflist | pick | sed 's/#.*$//'`
    eval "$command2 | tee ~/.mblaze/lastmfp | ${*:-mscan}"
}

mflast () {
    # mflast -- do an action on the last picked filter
    # default action is count
    eval "${*:-wc -l} < ~/.mblaze/lastmfp"
}

# Some utilies for neomutt, mutt-kz, or another mutt that supports
# Notmuch virtual folders.

_rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o
  pos=1
  while [ $pos -le $strlen ] ; do
     c=$(expr substr "$string" $pos 1)
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               o=$(printf '%%%02x' "'$c")
     esac
     encoded="${encoded}${o}"
     pos=$((pos + 1))
  done
  echo "${encoded}"
}

_mid () {
        mhdr -h Message-Id $* | sed -e 's/"/""/g' -e 's/^<//g' -e 's/>$//g'
}

mmutt () {
    mutteff -f "notmuch://`notmuch config get database.path`?query=mid:$(_rawurlencode $(_mid .))"
}
