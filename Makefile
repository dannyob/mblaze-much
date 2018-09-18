all : lint bin/mtag

uncrustify:
	uncrustify --no-backup --mtime --replace -c devel/uncrustify.cfg src/*.c

bin/mtag : mtag.c

mtag.c:
	cc src/mtags.c -lnotmuch -o bin/mtags
	
lint: lintmd lintman

lintmd:
	find . -name "*.md" -exec "markdownlint" "{}" ";" -exec "markdown-link-check" "{}" ";"

lintman: 
	mandoc -T lint man/mnm.1
