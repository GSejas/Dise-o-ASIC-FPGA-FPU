#!/bin/bash
ls -A ../source >file_list
find $PWD/../source/FPU_Interface/fpaddsub_arch2/ -name "*.v" -maxdepth 1 >>file_list
