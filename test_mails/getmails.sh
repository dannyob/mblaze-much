#!/bin/bash
mydir=$(readlink -f "$(dirname "$0")")
if [ -z "$mydir" ]; then
   echo "Could not find my own directory!" >&2
   exit -1
   else
       cd $mydir
   fi
if [ ! -f enron_mail_20150507.tar.gz ]; then
    echo "Downloading the Enron corpus" >&2
    wget -c 'https://www.cs.cmu.edu/~./enron/enron_mail_20150507.tar.gz'
    fi
if [ ! -d maildir/skilling-j/inbox/ ]; then
    echo "Untarring J Skilling's part of the enron corpus" >&2
    tar xvzf enron_mail_20150507.tar.gz 'maildir/skilling-j/'
fi
echo "Turning J Skilling's mailbox into Maildir directories" >&2
if [ -d tmail ]; then
    echo "There's already a test mailbox. Please remove the tmail directory before continuing." >&2
    exit -1
    fi
for i in $(ls -d1 maildir/skilling-j/*); do
    echo `basename $i` >&2
    mmkdir tmail/`basename $i`
    mrefile -v $i tmail/`basename $i`
done
rm -rf maildir
exit
