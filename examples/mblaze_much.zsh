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

function nn {
    # nn - fast notmuch new
    # run notmuch and afew quietly and quickly, to respond to file changes made by mblaze
    afew -m; notmuch new --no-hooks --quiet
}

function minbox() {
    #
    # find everything in the notmuch "inbox", and store it in the default sequence
    notmuch search --output=files tag:inbox | mseq -S
}

function march() {
    # mark as archived (mails tagged archive get moved out of my Maildir Inbox by a utility called afew)
    if [ -t 0 ]; then
        # we don't want to accidentally archive everything in the sequence
        mseq ${*:-.} | mtags -t | sed 's/+inbox/-inbox +archive/' | notmuch tag --batch
    else
        mtags -t | sed 's/+inbox/-inbox +archive/' | notmuch tag --batch
    fi
}

function mspam() {
    # mark as spam (mails tagged spam get moved out of my Maildir Inbox into a spam folder by a utility called afew)
    if [ -t 0 ]; then
        # we don't want to accidentally mark as spam everything in the sequence
        mseq ${*:-.} |mtags -t | sed 's/+inbox/-inbox +spam +missedspam/' | notmuch tag --batch
    else
        mtags -t | sed 's/+inbox/-inbox +spam +missedspam/' | notmuch tag --batch
    fi
}
