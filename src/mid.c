#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include <notmuch.h>
char database_path[BUFSIZ];

int
find_database_path ()
{
    FILE *fp = popen ("notmuch config get database.path", "r");

    if (! fgets (database_path, BUFSIZ, fp )) {
	pclose (fp);
	return 0;
    }
    pclose (fp);
    size_t l = strnlen (database_path, BUFSIZ);
    if (l == 0) {
	return 0;
    }
    database_path[l - 1] = '\0';
    return -1;
}

void
print_double_quoted (const char *s)
{
    putchar ('"');
    for (; *s; s++) {
	putchar (*s);
	if (*s == '"') {
	    putchar (*s);
	}
    }
    putchar ('"');
}

char encoded_tag[3 * NOTMUCH_TAG_MAX];
char pathname[4096];
int
main (int argc, char **argv)
{
    notmuch_database_t *db;
    notmuch_status_t st;
    notmuch_message_t *message;
    notmuch_tags_t *tags;
    const char *tag;

    errno = 0;
    if (! find_database_path ()) {
	fprintf (stderr, "Could not find notmuch database: %s\n", strerror (errno));
	exit (EXIT_FAILURE);
    }

    errno = 0;
    st = notmuch_database_open (database_path, NOTMUCH_DATABASE_MODE_READ_ONLY, &db);
    if (st != NOTMUCH_STATUS_SUCCESS ) {
	fprintf (stderr, "Could not open notmuch database: %s\n", strerror (errno));
	exit (errno);
    }

    while (fgets (pathname, sizeof pathname, stdin)) {
	pathname[strcspn (pathname, "\r\n")] = 0; /* chomps off EOL characters */
	st = notmuch_database_find_message_by_filename (db, pathname, &message);
	if (st != NOTMUCH_STATUS_SUCCESS || message == NULL) {
	    fprintf (stderr, "Could not open %s\n", pathname);
	    exit (EXIT_FAILURE);
	}

	if (ferror (stdin)) {
	    perror ("Could not read from input");
	    exit (errno);
	}

	printf ("id:");
	print_double_quoted (notmuch_message_get_message_id (message));
	printf ("\n");
	notmuch_message_destroy (message);
    }

    notmuch_database_close (db);
    exit (EXIT_SUCCESS);
}
