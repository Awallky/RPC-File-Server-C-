#!bin/bash/

gcc -g -o client client.c ssnfs_clnt.c ssnfs_xdr.c -lreadline
