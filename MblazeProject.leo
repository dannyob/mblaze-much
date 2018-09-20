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
<t tx="danny.20180918001828.1"></t>
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
</tnodes>
</leo_file>
