# Makefile for compiling the RPC server and client functions
S_OBJS = server.o ssnfs_xdr.0 ssnfs_svc.0
C_OBJS = client.o ssnfs_clnt.0 ssnfs_xdr.o
CC = gcc
DEBUG = -g
CFLAGS = -Wall -c $(DEBUG)
LFLAGS = -Wall $(DEBUG)

all: client server

client : client.o ssnfs_clnt.o  ssnfs_xdr.o
	gcc -g -o client client.o ssnfs_clnt.o ssnfs_xdr.o -lreadline

server: server.o ssnfs_xdr.o ssnfs_svc.o
	gcc -o server server.o ssnfs_svc.o ssnfs_xdr.o

client.o: ssnfs.h client.c
	gcc -c client.c

server.o: ssnfs.h server.c
	gcc -c server.c

ssnfs_svc.o: ssnfs.h ssnfs_svc.c
	gcc -c ssnfs_svc.c

ssnfs_clnt.o: ssnfs_clnt.c ssnfs.h
	gcc -c ssnfs_clnt.c

ssnfs_xdr.o: ssnfs_xdr.c ssnfs.h
	gcc -c ssnfs_xdr.c

ssnfs.h: ssnfs.x
	rpcgen ssnfs.x

clean:
	rm  -rf *.o *~ ssnfs_* ssnfs.h client server *.dat

