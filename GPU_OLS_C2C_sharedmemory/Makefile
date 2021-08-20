###############################################################
# CUDA_HOME are supposed to be on default position
# and set it in your PATH .bashrc
###############################################################
INC := -I${CUDA_HOME}/include
LIB := -L${CUDA_HOME}/lib64 -lcudart -lcufft -lcuda

GCC = g++
NVCC = ${CUDA_HOME}/bin/nvcc

# sm_62 is for Jetson TX2 (Pascal)
# Fermi and Kepler are deprecated from CUDA 9 and 11 onwards
# Maxwell is deprecated from CUDA 12 onwards
# Fermi Kepler	Maxwell	Pascal	Volta	Turing	Ampere	Lovelace	Hopper
# sm_20	sm_30	sm_50	sm_60	sm_70	sm_75	sm_80	sm_90?	sm_100c?
#	sm_35	sm_52	sm_61	sm_72		sm_86
#	sm_37	sm_53	sm_62
NVCCFLAGS = -O3 -arch=sm_62 --ptxas-options=-v --use_fast_math -Xcompiler -Wextra -lineinfo

GCC_OPTS =-O3 -Wall -Wextra $(INC)

ANALYZE = CONV.exe


ifdef reglim
NVCCFLAGS += --maxrregcount=$(reglim)
endif

all: clean onefilter

onefilter: CONV_SM_OLS_C2C.o  CONV-32bit_customFFT.o Makefile
	$(NVCC) -o CONV.exe CONV_SM_OLS_C2C.o CONV-32bit_customFFT.o $(LIB) $(NVCCFLAGS)

CONV-32bit_customFFT.o: timer.h utils_cuda.h
	$(NVCC) -c CONV-32bit_customFFT.cu $(NVCCFLAGS)

CONV_SM_OLS_C2C.o: CONV_SM_OLS_C2C.cpp
	$(GCC) -c CONV_SM_OLS_C2C.cpp $(GCC_OPTS)
	
clean:	
	rm -f *.o *.~ CONV_*.exe


