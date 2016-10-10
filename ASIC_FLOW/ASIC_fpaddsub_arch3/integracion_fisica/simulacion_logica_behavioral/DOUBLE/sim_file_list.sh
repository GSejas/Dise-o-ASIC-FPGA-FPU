find "../../front_end/source" -name "*.v" > file_list
find $PWD/../../../../sources/Source_Files/FPU_Interface/fpaddsub_arch2/ -name "*.v" -maxdepth 1 >>file_list
find . -name "*.v" >> file_list
