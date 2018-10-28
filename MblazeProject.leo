<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="danny.20180916211857.3"><vh>Documentation</vh>
<v t="danny.20180916202018.1"><vh>@auto-md MANIFESTO.md</vh></v>
<v t="danny.20180916231930.1"><vh>@auto-md README.md</vh></v>
</v>
<v t="danny.20180917215709.1"><vh>Development Diary</vh>
<v t="danny.20181027190905.1"><vh>2018-10-27</vh>
<v t="danny.20181027190911.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20181026225835.1"><vh>2018-10-26</vh>
<v t="danny.20181026225841.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20181017231755.1"><vh>2018-10-17</vh>
<v t="danny.20181017231801.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20181001222640.1"><vh>2018-10-01</vh>
<v t="danny.20181001222651.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180930152544.1"><vh>2018-09-30</vh></v>
<v t="danny.20180926223521.1"><vh>2018-09-26</vh>
<v t="danny.20180926223528.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180925222102.1"><vh>2018-09-25</vh>
<v t="danny.20180925222106.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180923183436.1"><vh>2018-09-23</vh>
<v t="danny.20180923183439.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180922151113.1"><vh>2018-09-22</vh>
<v t="danny.20180922220930.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180921195629.1"><vh>2018-09-21</vh>
<v t="danny.20180921213841.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180920210004.1"><vh>2018-09-20</vh>
<v t="danny.20180920210010.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180920012943.1"><vh>2018-09-19</vh>
<v t="danny.20180920012949.1"><vh>Things I've learned</vh></v>
</v>
<v t="danny.20180917215719.1"><vh>2018-09-17</vh>
<v t="danny.20180917220033.1"><vh>22:00</vh></v>
<v t="danny.20180917220056.1"><vh>22:01</vh></v>
<v t="danny.20180918002152.1"><vh>Things I've learned</vh></v>
</v>
</v>
<v t="danny.20180917220225.1"><vh>Future todos</vh>
<v t="danny.20180918001828.1"><vh>Write manpage for mtags</vh></v>
<v t="danny.20180917220237.1"><vh>Write a patch for notmuch to output tags for a filename</vh>
<v t="danny.20180917220056.1"></v>
</v>
<v t="danny.20181001222808.1"><vh>Write makefile so that vendor-mblaze is automatically filled out.</vh></v>
<v t="danny.20181001223655.1"><vh>Make makefile a bit more sane</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="danny.20180916211857.3"></t>
<t tx="danny.20180917215709.1"></t>
<t tx="danny.20180917215719.1">



</t>
<t tx="danny.20180917220033.1">My first commit was to fix a misgendering in the MANIFESTO. A not entirely auspicious start, but a great correction. Plus it was pointed out to me by someone on Mastodon, thus proving why it's good to code in the open.</t>
<t tx="danny.20180917220056.1">I'm programmming in C! For the first time in a long time! This is because I need to write a small utility that will take a filename (which is the basic unit of communication in mblaze) and output the notmuch tags associated with that filename/mail message.

It's not too tricky, though I think it should actually be built into the standard notmuch utilities, possibly as an extension to the query language. You can specify a directory to concentrate your search in, but I think you should be able to search for a message in a particular file, too.

I don't seem to be the only one who thinks this! There was an IRC conversation just as I was trying to work out how to do this:

&lt;anarcat&gt; [15:18:40] can i use "path:" to match the full message filename? e.g. would "path:/,FS$/" work?
&lt;anarcat&gt; [15:18:43] it doesn't look like it
* anarcat [15:20:41] reread the manpage and it matches only the directory part of course
&lt;anarcat&gt; [15:20:50] sigh - it would be great to have a search term for that</t>
<t tx="danny.20180917220225.1"></t>
<t tx="danny.20180917220237.1">I think the best way to do this is to add to the query syntax, file:&lt;filename&gt;.
</t>
<t tx="danny.20180918001828.1" annotate="7d71002855087072696f7269747971014b64550a707269736574646174657102550a323031382d31302d30317103752e" icons="5d71007d71012855026f6e71025505766e6f646571035504747970657104550466696c6571055507796f666673657471064b005508636c656f49636f6e710755013171086805585b0000002f7573722f6c6f63616c2f6c69622f707974686f6e322e372f646973742d7061636b616765732f6c656f2d352e372e322e6465763438362d7079322e372e6567672f6c656f2f49636f6e732f636c656f2f63686b626c6b2e706e677109550478706164710a4b0155057768657265710b550e6265666f7265486561646c696e65710c5507786f6666736574710d4b02550772656c50617468710e580f000000636c656f2f63686b626c6b2e706e67710f75612e"></t>
<t tx="danny.20180918002152.1">* fputs has the FILE argument at the end, fprintf has it at the beginning.
* Clang-format is good for formatting, but there doesn't seem to be a way of it learning a new style from examples.
* I really don't know how to write a Makefile. Still.
* Uncrustify is a decent code formatter (which also has a limited way of deriving a configuration from sample code).
</t>
<t tx="danny.20180920012943.1"></t>
<t tx="danny.20180920012949.1">* DevDocs is great for C documentation.
* C constantly tempts you into concise, but unsafe forms (especially array bounds checking)
* I don't like two braces straight after another in the same indent level.
* Somebody should have decided on a single canonical way to escape text. Oh well.
</t>
<t tx="danny.20180920210004.1"></t>
<t tx="danny.20180920210010.1">* fgets and gets, and such are kind of a mess in how they handle '\r' and bounds checking. I wonder what the history is there?
* It's still pretty hard to find simple versions of common C tricks online. For instance:
     buffer[strcspn (buffer, "\r\n")] = 0;
  looks like an acceptable way to strip EOL chars from a fgets,  but it took me a while to find it. Useful function though!
* Rather than load up complexity in the binary I'm writing, I'm going to split it into two smaller utilities. LIVIN' LA VIDA http://harmful.cat-v.org/cat-v/unix_prog_design.pdf
* I realised that one of the niggles I have with mutt is that it feels perceptually slow, especially when I'm dealing with filing lots of mail. I'm going to try to keep to Paul Buchheit's maxim of sub-100ms interaction. I think that's about 10K of lines printed on kitty, the fast terminal I use these days. Maybe doable?</t>
<t tx="danny.20180921195629.1"></t>
<t tx="danny.20180921213841.1">* Breaking these down into little utilities was a good idea. Things have got simpler, and also I may be able to more easily remove extra cruft in the future.
* Writing getopt with short options and a terse usage statement feels like I'm in 70s Unix re-enactment society. Not in a bad way!
* Drafting manpages is harder than it looks -- or perhaps, exactly as hard as it looks. I feel I may have fallen into a trap using mandoc, but right now it seems much clearer than the old man macros.
* I hope someone is recording the oral history of UNIX before we start losing the memories.
* I am so slow at this!
* I do love git-cola! https://git-cola.github.io/
</t>
<t tx="danny.20180922151113.1">Exciting developments!
I've come up with some small scripts to do useful things!

Ooh i'm getting into serious stuff now. I want to use some of mblaze's parsing cleverness, which means linking an object library to my c code. I HAVE NO IDEA WHAT I'M DOING.

i have no idea about the right way to refer to someone else's source code. Do I just copy it across? Do some sort of git submodule? Have a vendor directory, or just symlink it and then apologise in the readme?

I guess maybe git submodules for now? https://blog.github.com/2016-02-01-working-with-submodules/

Oh boy I guess I can fix this later right?

</t>
<t tx="danny.20180922220930.1">I learned a lot about mblaze! I learned that most of the magic of parsing of mmsgs is probably embedded in blaze822.c and seq.c!
I started getting good at small one-liners.</t>
<t tx="danny.20180923183436.1"></t>
<t tx="danny.20180923183439.1">* eval in shell scripts isn't quite as bad as eval in every other language (maybe because /everything/ in shell scripts is like eval in other languages).
* I wonder how much easier environments would be to learn if you learned them in historical order. Remembering sci-fi stories of code archaeologists.
* I'm already collecting a bunch of one-liner recipers that are unique to my setup. It's hard to convey these; I think Unix culture could have done with a better way of passing these one-liners onto new people.
</t>
<t tx="danny.20180925222102.1"></t>
<t tx="danny.20180925222106.1">* 'local' in shell functions is useful!
* libphonenumbers, https://github.com/openvenues/libpostal, https://github.com/daviddrysdale/python-phonenumbers for my email2vcard tool
* if you put an "=" in front of a command in zsh, it works like `which command`</t>
<t tx="danny.20180926223521.1"></t>
<t tx="danny.20180926223528.1">* my notmuch new hooks call afew, which itself calls "notmuch new", which is re-entrantly annoying
* I think I finally understand the difference between say .zshprofile (which is read in shells that are executing scripts) and .zshrc which is run only when there's an interactive (you typing at it) shell.
* </t>
<t tx="danny.20180930152544.1"></t>
<t tx="danny.20181001222640.1"></t>
<t tx="danny.20181001222651.1">I learned a bit more about Makefile -- mainly that it has many magical secret defaults that most makefiles rely on.
I still haven't really worked out how to do vendor code (or rather use other people's code).
</t>
<t tx="danny.20181001222808.1" annotate="7d71002855087072696f7269747971014b64550a707269736574646174657102550a323031382d31302d30317103752e" icons="5d71007d71012855026f6e71025505766e6f646571035504747970657104550466696c6571055507796f666673657471064b005508636c656f49636f6e710755013171086805585b0000002f7573722f6c6f63616c2f6c69622f707974686f6e322e372f646973742d7061636b616765732f6c656f2d352e372e322e6465763438362d7079322e372e6567672f6c656f2f49636f6e732f636c656f2f63686b626c6b2e706e677109550478706164710a4b0155057768657265710b550e6265666f7265486561646c696e65710c5507786f6666736574710d4b02550772656c50617468710e580f000000636c656f2f63686b626c6b2e706e67710f75612e"></t>
<t tx="danny.20181001223655.1">Make vendor-mblaze do something clever other than checking out and making code.
Use makefile defaults wisely.</t>
<t tx="danny.20181017231755.1"></t>
<t tx="danny.20181017231801.1">* checkbashisms is a utility for removing BASH or ZSH additions, so you can write a script that works for all POSIXish shells.
* Big zsh bash/dash difference:  "One commonly encountered difference is that variables substituted onto the command line are not split into words.  See the description of the shell option SH_WORD_SPLIT in the section `Parameter Expansion' in zshexpn(1)."</t>
<t tx="danny.20181026225835.1"></t>
<t tx="danny.20181026225841.1">I've learned so much about using less as a super-powered pager!
</t>
<t tx="danny.20181027190905.1"></t>
<t tx="danny.20181027190911.1">If you think hard enough, you can replace a C program with a shell script.
</t>
</tnodes>
</leo_file>
