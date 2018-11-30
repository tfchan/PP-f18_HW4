#include <stdio.h>
#include <stdlib.h>

#define MAXPOINTS 1000000
#define MAXSTEPS 1000000
#define MINPOINTS 20

int nsteps,     // Number of time steps
    tpoints;    // Total points along string

void check_param(void) {
    char tchar[20];

    // check number of points, number of iterations
    while ((tpoints < MINPOINTS) || (tpoints > MAXPOINTS)) {
        printf("Enter number of points along vibrating string [%d-%d]: ", MINPOINTS, MAXPOINTS);
        scanf("%s", tchar);
        tpoints = atoi(tchar);
        if ((tpoints < MINPOINTS) || (tpoints > MAXPOINTS))
            printf("Invalid. Please enter value between %d and %d\n", MINPOINTS, MAXPOINTS);
    }
    while ((nsteps < 1) || (nsteps > MAXSTEPS)) {
        printf("Enter number of time steps [1-%d]: ", MAXSTEPS);
        scanf("%s", tchar);
        nsteps = atoi(tchar);
        if ((nsteps < 1) || (nsteps > MAXSTEPS))
            printf("Invalid. Please enter value between 1 and %d\n", MAXSTEPS);
    }
}

int main(int argc, char *argv[]) {
    sscanf(argv[1],"%d",&tpoints);
    sscanf(argv[2],"%d",&nsteps);
    check_param();

    return 0;
}