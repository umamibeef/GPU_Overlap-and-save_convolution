#!/bin/bash

rm CONV_cuFFT.dat;

./benchmark_performance.sh;
mv CONV_cuFFT.dat OLS_cuFFT_C2C_perf.dat;

./When_cuFFT_wins_cuFFT.sh
mv CONV_cuFFT.dat OLS_cuFFT_C2C_whencuFFTwins.dat;