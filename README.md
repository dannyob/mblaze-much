# Using mblaze with notmuch

[Mblaze](https://github.com/chneukirchen/mblaze) is a set of tools by Leah
Neukirchen that lets you treat email in the One True Unix way — as files of
mostly textual data that you can display, search and transform using small
utilities, all connected by pipes via shell utilities. It works well with email
stored in Maildir format, where each email is stored as an individual file in
directories that represent email folders.

[Notmuch](https://notmuchmail.org/) is a separate project for indexing and
searching Maildirs containing a *lot* of email.

[Mblaze-Much](.) is a collection of command line tools and shell scripts to tie
mblaze and notmuch together, so that you can quickly search and triage large
quanties of email. It can cope with mail archives with millions of messates,
and help handle hundreds of incoming email a day.

This is currently a work in progress, but if you'd like to explore, here are
some places to start:

[src/mtags](src/mtags)  - a standalone C utility that takes a list of files, and outputs their notmuch tags.
[examples/mblaze_much.sh](examples/mblaze_much.sh)  - a collection of useful shell functions, including:
mnm -- takes a notmuch search query and turns it into a list of files suitable for feeding to mblaze's mseq
mt -- takes a mblaze sequence and outputs all other email in the same thread found by notmuch
minbox -- creates an mblaze sequence of every email tagged 'inbox'
mtoday -- creates an mblaze sequence of recent email tagged 'inbox'
mbatchtag -- add or remove tag on an mblaze sequence
march -- changes the tags on a sequence so that it is no longer tagged inbox, and is tagged for archiving
mspam -- changes the tags on a sequence so that it is no longer tagged inbox, and is tagged as spam
mid -- output the message IDs of an mblaze sequence
[examples/muchless](examples/muchless) - mblaze's  mless, adapted to show tags and  archive or mark emails as spam
[examples/muchlesskey.notmuch](examples/muchlesskey.notmuch) - keybindings for muchless

mtags and mnm have man pages, found in [man](man).
