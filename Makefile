# Makefile for Hesiod/Zephyr client finger
#
#	MIT Project Athena
#
#	$Source: /afs/dev.mit.edu/source/repository/athena/bin/finger/Makefile,v $
#	$Header: /afs/dev.mit.edu/source/repository/athena/bin/finger/Makefile,v 1.7 1989-02-22 16:51:28 epeisach Exp $
#	$Author: epeisach $
#	$Log: not supported by cvs2svn $
# Revision 1.6  87/12/04  11:36:25  shanzer
# Added -ldes to the list of libriaries..
# 
# Revision 1.5  87/08/27  16:56:33  ambar
# fixed clean target.
# 
# Revision 1.5  87/08/27  16:41:44  ambar
# fixed clean target
# 
# Revision 1.4  87/08/21  18:30:58  ambar
# typo fix
# 
# Revision 1.3  87/08/21  18:28:18  ambar
# changed the name of the hesiod file.
# 
# Revision 1.2  87/08/20  16:11:21  ambar
# 
# oops: excess backslash removed.
# 
# Revision 1.1  87/08/20  16:02:51  ambar
# Initial revision
# 
#
DESTDIR=
CFLAGS = -O
CONFDIR = ${DESTDIR}/usr/athena
BINDIR = ${DESTDIR}/bin

LIBS =  -lhesiod -lzephyr -lcom_err -lkrb -ldes

SRCS =	finger.c hespwnam.c

OBJECTS = finger.o hespwnam.o

all:	finger

finger:	${OBJECTS}
	cc ${CFLAGS} -o finger ${OBJECTS} ${LIBS}

finger.o:	finger.c
	cc -c ${CFLAGS} finger.c

hespwnam.o:	hespwnam.c
	cc -c ${CFLAGS} hespwnam.c

lint:
	lint -I../../include *.c

clean:	
	rm -f *.o *~ *.BAK
	rm -f finger

install:	finger
	install -c -s -m 755 finger ${DESTDIR}/usr/athena/finger
