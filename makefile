CC = gcc
AR = ar
CFLAGS = -Wall -g

OBJECT_MAIN = main.o
OBJECTS_LOOP = basicClassification.o advancedClassificationLoop.o
OBJECTS_REQ = basicClassification.o advancedClassificationRecursion.o

.PHONY: clean all loops loopd recursives recursived

all: libclassloops.a mains maindloop maindrec

mains: libclassrec.a $(OBJECT_MAIN)
	${CC} ${CFLAG} -L. $(OBJECT_MAIN) -lclassrec -o $@

maindloop: libclassloops.so $(OBJECT_MAIN)
	${CC} ${CFLAG} -L. $(OBJECT_MAIN) -lclassloops -o $@

maindrec: libclassrec.so $(OBJECT_MAIN)
	${CC} ${CFLAG} -L. $(OBJECT_MAIN) -lclassrec -o $@

loops: libclassloops.a

loopd: libclassloops.so

recursives: libclassrec.a

recursived: libclassrec.so

libclassloops.a : $(OBJECTS_LOOP)
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP)

libclassloops.so : $(OBJECTS_LOOP)
	${CC} -shared $(OBJECTS_LOOP) -o libclassloops.so

libclassrec.a : $(OBJECTS_REQ)
	$(AR) -rcs libclassrec.a $(OBJECTS_REQ)

libclassrec.so : $(OBJECTS_REQ)
	${CC} -shared $(OBJECTS_REQ) -o libclassrec.so

$(OBJECT_MAIN): main.c NumClass.h
	${CC} ${CFLAG} -c main.c

basicClassification.o: basicClassification.c
	${CC} ${CFLAG} -fPIC -c basicClassification.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	${CC} ${CFLAG} -fPIC -c advancedClassificationRecursion.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	${CC} ${CFLAG} -fPIC -c advancedClassificationLoop.c

clean:
	rm -f *.o *.so *.a mains maindrec maindloop

