binaries : bin/mtags

all: uncrustify lint binaries

leo:
	git add MblazeProject.leo
	git commit  -m "Update Leo project."

vendor-mblaze:
	git clone git@github.com:chneukirchen/mblaze.git vendor-mblaze
	(cd vendor-mblaze ; make)

uncrustify:
	uncrustify --no-backup --mtime --replace -c devel/uncrustify.cfg src/*.c

bin/mtags : src/mtags.c
	@mkdir -p bin
	cc src/mtags.c -lnotmuch -o bin/mtags -Ivendor-mblaze vendor-mblaze/blaze822.o vendor-mblaze/mymemmem.o vendor-mblaze/mytimegm.o vendor-mblaze/seq.o vendor-mblaze/slurp.o vendor-mblaze/mystrverscmp.c

lint: lintmd lintman

lintmd:
	# See https://github.com/igorshubovych/markdownlint-cli and
	# https://github.com/tcort/markdown-link-check
	find . -name "vendor-*" -prune -o -name "*.md" -exec "markdownlint" "{}" ";" -exec "markdown-link-check" "{}" ";"

lintman: 
	mandoc -T lint man/*.1
