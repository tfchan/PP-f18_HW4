#include <stdio.h>
#include <stdlib.h>

#define MAXPOINTS 1000000
#define MAXSTEPS 1000000
#define MINPOINTS 20

int nsteps,     // Number of time steps
    tpoints;    // Total points along string
float values[MAXPOINTS + 2];    // Values at time t

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

void printfinal() {
    for (int i = 1; i <= tpoints; i++) {
        printf("%6.4f ", values[i]);
        if (i%10 == 0)
            printf("\n");
    }
}

int main(int argc, char *argv[]) {
    float *dValues; // Values in device
    int size = (MAXPOINTS + 2) * sizeof(float); // Size of memory to store values

    sscanf(argv[1],"%d",&tpoints);
    sscanf(argv[2],"%d",&nsteps);
    check_param();
    cudaMalloc(&dValues, size);

    cudaMemcpy(values, dValues, size, cudaMemcpyDeviceToHost);
    printf("Printing final results...\n");
    printfinal();
    printf("\nDone.\n\n");
    cudaFree(dValues);
    return 0;
}