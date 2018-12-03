# PP-f18_HW4

Concurrent wave equation with CUDA

## Build

- Serial version

      make serial_wave

- CUDA version

      make cuda_wave

## Run

- Compare time between two version and check result

      ./compare.sh <total points> <number of time steps>

- Serial version

      ./serial_wave <total points> <number of time steps>

- CUDA version

      ./cuda_wave <total points> <number of time steps>

## Reference

[Wave equation](https://en.wikipedia.org/wiki/Wave_equation)

[CUDA C Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html)
