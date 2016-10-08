function finalresult(n,typ)
  #n=1023;
  #typ=0;
#Llamar los valores teoricos y practicos
  file_id1=fopen("Hexadecimal_R.txt"); #Valor teorico
  file_id2=fopen("ResultadoXilinxFLM.txt"); #Creo que esto es lo que me saca la simulacion
  file_id3=fopen("FLMvsTeorico.txt","w"); #Error teorico vs segunda iteracion
 % file_id4=fopen("ResultadoXilinxDRV.txt"); #Creo que esto es lo que me manda la FPGA en la verificacion
  file_id5=fopen("Decimal_FLM.txt","w");
 % file_id6=fopen("Decimal_DRV.txt","w");
 % file_id7=fopen("FLMvsDRV.txt","w");

  
  result_t_hex=fgets(file_id1); #Valor cero - pimera fila- no calculado
  #Calculo de error
  for i=1:n
    result_t_hex=fgets(file_id1); #Valor hexadecimal teorico
    result_FLM_hex=fgets(file_id2); #Valor hexadecimal FLM
 %   result_DRV_hex=fgets(file_id4);
    result_FLM_hex = result_FLM_hex(1:end-1); #Elimina \n en la linea cargada
    result_t_hex= result_t_hex(1:end-1);
 %   result_DRV_hex = result_DRV_hex(1:end-1);

    if typ==0 #Conversion a formato simple
      result_t_dec=hex2num(result_t_hex, "single");
      result_FLM_dec=hex2num(result_FLM_hex, "single");
 %    result_DRV_dec=hex2num(result_DRV_hex, "single");
    elseif typ==1 #Conversion a formato doble
      result_t_dec=hex2num(result_t_hex);
      result_FLM_dec=hex2num(result_FLM_hex);
 %   result_DRV_dec=hex2num(result_DRV_hex);
    endif  
    
    ######################################################
    #Calculo error teorico VS FLM 
    
    A=(abs(abs(result_t_dec)-abs(result_FLM_dec))); 
    perc_errorT=(A/abs(result_t_dec))*100; 
    array_percT(i)=perc_errorT;
    ######################################################
    #Calculo error DRV VS FLM
    
 %   B=(abs(abs(result_DRV_dec)-abs(result_FLM_dec))); 
 %   perc_errorDRV=(B/abs(result_DRV_dec))*100; 
 %   array_percDRV(i)=perc_errorDRV;   
    ######################################################
    #Guardar valores
    fprintf(file_id3, "%f\n", perc_errorT);
 %   fprintf(file_id7, "%f\n", perc_errorDRV);
    fprintf(file_id5, "%f\n", result_FLM_dec);
 %   fprintf(file_id6, "%f\n", result_DRV_dec);
    #disp(array_percT(n));
    #plot(X,array_percT,'.');
  endfor
  
  
  #celldisp(perc_errorT);
  #plot(X,array_percT,'.');
  #print("ErrorTeorico",'png');
  
  #plot(X,perc_errorDRV{X},'-Q');
  #print("ErrorFPU",'png');
    
  
  fclose("all");
end
    
