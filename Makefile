TARGET = cuda_wave serial_wave
CC = gcc
CFLAGS = -lm

.PHONY = all clean

cuda_wave:%:%.cu
	nvcc $< -o $@
serial_wave:%:%.c
	${CC} $< -o $@ ${CFLAGS}
all:${TARGET}
clean:
	${RM} ${TARGET}
