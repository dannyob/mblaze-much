binaries : bin/mtag bin/mid

all: uncrustify lint binaries

uncrustify:
	uncrustify --no-backup --mtime --replace -c devel/uncrustify.cfg src/*.c

bin/mtag : mtag.c

bin/mid : mid.c

mtag.c:
	cc src/mtags.c -lnotmuch -o bin/mtags
	
mid.c:
	cc src/mid.c -lnotmuch -o bin/mid

lint: lintmd lintman

lintmd:
	find . -name "*.md" -exec "markdownlint" "{}" ";" -exec "markdown-link-check" "{}" ";"

lintman: 
	mandoc -T lint man/mnm.1
