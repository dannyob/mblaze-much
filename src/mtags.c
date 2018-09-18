#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <notmuch.h>
char database_path[BUFSIZ];

int 
find_database_path () {
    FILE *fp = popen ("notmuch config get database.path", "r");
    if (!fgets (database_path, BUFSIZ, fp )) { 
        pclose(fp);
        return 0;
    }
    pclose (fp);
    size_t l = strnlen (database_path, BUFSIZ) ;
    if (l==0) return 0;
    database_path[l-1] = '\0';
    return 1;
}

int 
main (int argc, char **argv) {
    notmuch_database_t *db;
    notmuch_status_t st;
    notmuch_message_t *message;
    notmuch_tags_t *tags;
    const char *tag;

    errno = 0;
    if (!find_database_path ()) {
        fprintf (stderr, "Could not find notmuch database: %s\n", strerror(errno));
        exit (EXIT_FAILURE);
    }

    errno = 0;
    st = notmuch_database_open (database_path , NOTMUCH_DATABASE_MODE_READ_ONLY, &db);
    if (st != NOTMUCH_STATUS_SUCCESS ) {
        fprintf (stderr, "Could not open notmuch database: %s\n", strerror(errno));
        exit (errno);
    }

    for (int i=1; i< argc; i++) {
        st = notmuch_database_find_message_by_filename (db, argv[i], &message);
        if (st != NOTMUCH_STATUS_SUCCESS || message == NULL) {
            fprintf (stderr, "Could not open %s\n", argv[i]);
            exit (EXIT_FAILURE);
        }
        printf ("%s :", argv[i]);
        for (tags = notmuch_message_get_tags (message); 
                notmuch_tags_valid (tags); 
                notmuch_tags_move_to_next (tags)) { 
            tag = notmuch_tags_get (tags); printf (" %s",  tag); 
        }
        notmuch_message_destroy (message);
        puts("");
    }

    notmuch_database_close (db);
    exit (EXIT_SUCCESS);
}
