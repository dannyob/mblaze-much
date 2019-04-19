# Mblaze-much: Using mblaze with notmuch

*** I've now ceased working on these tools. **

[Mblaze](https://github.com/chneukirchen/mblaze) is a set of tools by Leah
Neukirchen that lets you treat email in the One True Unix way — as files of
mostly textual data that you display, search and transform with shell commands,
connected with pipes. It works well with email stored in Maildir format, where
each email is stored as an individual file in directories that represent email
folders.

[Notmuch](https://notmuchmail.org/) is a separate project for indexing and
searching Maildirs that contain a *lot* of email. It lets you mark emails with
tags like "inbox" or "important", and do full text searching of large email
archives.

_[Mblaze-Much](README.md)_  is a collection of command line tools and shell
scripts to tie mblaze and notmuch together. It helps you triage hundreds of
incoming emails and investigate millions of archived mails quickly via the
command line.

If you're comfortable with Unix shell commands, and have ever been frustrated
with GUI or TUI email clients like Thunderbird or Mutt because they don't let
you treat your email as a pile of big, mungeable data, this setup might be for
you.

Mblaze-much is currently a work in progress, but if you'd like to explore, here are
some places to start:

[mtags](src/mtags.c)  - a standalone C utility that takes a list of files, and outputs their notmuch tags.

[mblaze_much.sh](examples/mblaze_much.sh)  - a collection of useful shell functions, including:

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

If you're craving more documentation,  mtags and mnm have man pages, found in [man](man).
