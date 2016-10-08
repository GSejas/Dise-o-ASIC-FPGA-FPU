#!/bin/bash
#IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat copy_sources.sh))'
#echo "${XYZ[5]}"

#for i in "${IFS[@]}"
#do
#  cp $i -
#done

# dir_list=(ASIC_cordic_Arch2 ASIC_cordic_Arch3 ASIC_fpaddsub_arch2 ASIC_fpaddsub_arch3 ASIC_fpmult_arch2 ASIC_fpmult_arch3 ASIC_KOA ASIC_RKOA)
# for i in "${dir_list[@]}"
# do

# done

#find $PWD -type d -name "source" -exec cp -Rp temp '{}' \;

#ln --symbolic ../my_sourcefiles DESTINY
#ls >dir_list
#sed -i '/dir_list/d' dir_list  #borramos en las dependencias el nombre del mismo archivo que lleva las dependencias

# IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(cat dir_list))'
# echo "${XYZ[5]}"
# for i in "${IFS[@]}"
# do

#  ln --symbolic "$i" "${i}_sym"

# done
# Array=(cordic_Arch2 cordic_Arch3 fpaddsub_arch2 fpaddsub_arch3 fpmult_arch2 fpmult_arch3)
# for i in "${Array[@]}"
# do
#  cp -H  ${i}_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_${i}_sym/integracion_fisica/front_end/source/.
# done
# cp -H  cordic_Arch2_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2_sym/integracion_fisica/front_end/source/
# cp -H  cordic_Arch3_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch3_sym/integracion_fisica/front_end/source/
# cp -H  fpaddsub_arch2_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_fpaddsub_arch2_sym/integracion_fisica/front_end/source/
# cp -H  fpaddsub_arch3_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_fpaddsub_arch3_sym/integracion_fisica/front_end/source/
# cp -H  fpmult_arch2_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_fpmult_arch2_sym/integracion_fisica/front_end/source/
# cp -H  fpmult_arch3_sym /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_fpmult_arch3_sym/integracion_fisica/front_end/source/

# ln --symbolic /home/jorge/Documents/Karatsuba_FPU/my_sourcefiles/Source_Files/FPU_Interface/cordic_Arch3 /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2/integracion_fisica/front_end/source/cordic_Arch2_sym

# ln --symbolic /home/jorge/Documents/Karatsuba_FPU/my_sourcefiles/Source_Files/FPU_Interface/cordic_Arch3 /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2/integracion_fisica/front_end/source/cordic_Arch3_sym
ln --symbolic /home/jorge/Documents/Karatsuba_FPU/my_sourcefiles/Source_Files/FPU_Interface/fpaddsub_arch2 /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2/integracion_fisica/front_end/source/fpaddsub_arch2_sym
ln --symbolic /home/jorge/Documents/Karatsuba_FPU/my_sourcefiles/Source_Files/FPU_Interface/fpaddsub_arch3 /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2/integracion_fisica/front_end/source/fpaddsub_arch3_sym

ln --symbolic /home/jorge/Documents/Karatsuba_FPU/my_sourcefiles/Source_Files/FPU_Interface/fpmult_arch2 /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2/integracion_fisica/front_end/source/fpmult_arch2_sym
ln --symbolic /home/jorge/Documents/Karatsuba_FPU/my_sourcefiles/Source_Files/FPU_Interface/fpmult_arch2 /home/jorge/Documents/Karatsuba_FPU/ASIC_FLOW/ASIC_cordic_Arch2/integracion_fisica/front_end/source/fpmult_arch3_sym
