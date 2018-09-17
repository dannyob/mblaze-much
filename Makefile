lint: lintmd lintman

lintmd:
	find . -name "*.md" -exec "markdownlint" "{}" ";" -exec "markdown-link-check" "{}" ";"

lintman: 
	mandoc -T lint man/mnm.1
