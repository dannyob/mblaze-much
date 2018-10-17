# These are some example functions, taken from my own mail routines and setup.
#
# I use [afew](https://github.com/afewmail/afew) to keep my Maildir directories
# synced with my notmuch tags -- so if something is tagged "inbox" it stays in
# my INBOX Maildir, but if something is in my INBOX and tagged "archive" it
# gets moved into an archive folder. Similarly, mail marked "spam" get moved to
# a spam folder.

function mnm() {
    # mnm - mblaze notmuch
    # search and return a list of files, suitable for mblaze functions
    notmuch search --output=files $*
}

function ms() {
    # ms - mshow with tags
    # shortcut to show current email with tags appended
    mshow $*
    mtags .
}

function nn {
    # nn - fast notmuch new
    # run notmuch and afew quietly and quickly, to respond to file changes made by mblaze
    # (my notmuch hooks get new mail, unless DONOTSYNC is set)
    DONOTSYNC=1 afew -t tag:inbox
    DONOTSYNC=1 afew -m tag:inbox
}

function minbox() {
    # minbox - mblaze my inbox
    # find everything in the notmuch "inbox", and store it in the default sequence
    notmuch search --output=files tag:inbox | msort -r -d -U | mseq -S
}

function mtoday() {
    # mtoday - focus on today's email (I have a broad view of 'today')
    notmuch search --output=files "tag:inbox AND ( date:today OR date:yesterday )" | msort -r -d -U | mseq -S
}

function mflag() {
    # mflag - toggle 'important' flag
    mbatchtag "awk '/+flagged/ { sub(/+flagged/,\"-flagged\"); print; next}; !/+flagged/ { printf \"+flagged \";print; next }' " $*
}

function mspam() {
    # mark as spam (mails tagged spam get moved out of my Maildir Inbox into a spam folder by a utility called afew)
    mbatchtag "sed 's/+inbox/-inbox +spam +missedspam/'" $*
}

function march() {
    # mark as archived (mails tagged archive get moved out of my Maildir Inbox by a utility called afew)
    mbatchtag "sed 's/+inbox/-inbox +archive/'" $*
}

function mt() {
    # find all in same thread as this email
    # uses notmuch's threading knowledge, not mblaze's
    mnm `notmuch search --output=threads $(mseq ${*:-.} | mid)`
}

function mbatchtag() {
    action=$1
    shift
    if [ -t 0 ]; then
        # we don't want to accidentally action all the things if don't give another argument
        mtags -t ${*:-.} | eval $action | notmuch tag --batch
    else
        mtags -t | eval $action | notmuch tag --batch
    fi
}
