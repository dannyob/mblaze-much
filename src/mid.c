#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

#include <notmuch.h>
#include "blaze822.h"

char database_path[BUFSIZ];
notmuch_database_t *db;

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

void
mid (char *file)
{
    notmuch_status_t st;
    notmuch_message_t *message;

	st = notmuch_database_find_message_by_filename (db, file, &message);
	if (st != NOTMUCH_STATUS_SUCCESS || message == NULL) {
	    fprintf (stderr, "Could not open %s\n", file);
	    exit (EXIT_FAILURE);
	}

	printf ("id:");
	print_double_quoted (notmuch_message_get_message_id (message));
	printf ("\n");
	notmuch_message_destroy (message);
}

int
main (int argc, char **argv)
{
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

    if (argc == 1 && isatty(0))
    blaze822_loop1 (":", mid);
    else
    blaze822_loop (argc-1, argv+1, mid);

    notmuch_database_close (db);
    exit (EXIT_SUCCESS);
}
