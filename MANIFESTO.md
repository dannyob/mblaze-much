# MANIFESTO

My goal with this project is to build a mail-handling system that is:

* Compatible with my current IMAP+Maildir+notmuch setup, and which is
* easily automatable,
* and can be fed into self-contained machine-learning or anti-spam systems,
* with a flexible notification system,
* all of which I will be able to access using multiple user-interfaces,
* including future GUIs optimized for my own use case.

* Stretch goal: implement the Buchheit rule -- every interaction <100ms

I've settled on basing this around
[mblaze]( https://github.com/chneukirchen/mblaze ), a modern command-line,
composable mail system in the tradition of
[mh](https://en.wikipedia.org/wiki/MH_Message_Handling_System). Both mblaze and
mh are mail user agents (MUAs), but do not present a terminal or GUI user
interface like mutt or Thunderbird. Instead, the user reads and processes mail
by using a series of commands on the command line. Each command has a separate
function -- loading new email, reading the current email, replying or filing
away an email. Furthermore, mblaze commands are intended to be composed
together using the shell's pipe features, or by using intermediate files.

Mblaze expects emails to be stored in the Maildir format, which I already use;
however I also organize my mail using [notmuch](https://notmuchmail.org/), a
Maildir-compatible, tag-based indexing and search system. For many years, I've
worked with all of these tools using a patched version of mutt which creates
"virtual mailbozes" out of notmuch queries. So, for instance, when I start up
mutt, it shows me an inbox of all my mail that is made up of any mail that has
the tag "inbox" in the Notmuch database. Notmuch can find mail in any number of
Maildir locations. To keep everything compatible with less weird set-ups, I
keep my Maildir folders, which are stored in separate directories, synchronized
with my tags -- everything tagged with "inbox" should be in my INBOX mail
directory, stuff archived in the "archive2018" mail directory should be tagged
"archive2018", etc. At least in theory. Currently I use yet another utility
called [afew](https://github.com/afewmail/afew) to automatically move emails
into the right location.

I'm feeling overwhelmed with my email backlog, even using mutt. My preference
would be to occasionally be able to take 40,000 feet view of my email, and to
easily search it, but mostly concentrate on one email at a time. My goal is to
take the new ideas in mblaze (which mblaze's author, Leah Neukirchen, is still
exploring), and apply them to my mail setup, adding new utilities to handle
notmuch tagging and refiling and synchronizing email when I need to.

I have an interest in understanding and exploiting to the full the old school
[Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy) I feel myself
moving towards in the later decades of my life. I would like to leave the world
with my emails tidily sorted, in a documented archive format, on a platform I
have been securely and comfortably using for many years.

I am a little skeptical of my motives in, and my chances of, creating a perfect
email system using just the commmand line and an idiosyncratic wiring of
multiple utilities. Even the creators of the "Unix way" have moved on to other
ways of managing their lives. But just as it is pleasant to play old music on
old instruments, and even compose new music in old styles, I enjoy this
challenge. Perhaps a little more than I enjoy reading and replying to emails in
a timely fashion.
