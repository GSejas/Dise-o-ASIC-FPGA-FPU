function mediaerror()
  n=1022;
  global add_percT=0;
  global add_percDRV=0;
  #typ=0;
  #Llamar los valores teoricos y practicos
  Teorico=load("FLMvsTeorico.txt")
  Exp=load("FLMvsDRV.txt")
  add_percT=0;
  add_desv=0;
  ###media estandar
  for i=1:n
    add_percT=add_percT+Teorico(i);
    add_percDRV=add_percDRV+Exp(i);
  endfor
  errorT=add_percT/n;
  errorDRV=add_percDRV/n;
  #disp(errorT);  
  #disp(errorDRV);
  #####Desviacion estandar
  for i=1:n
    add_desv=add_desv+(Exp(i)-errorDRV)^2;
  endfor
  desv=sqrt(add_desv/n); 
  disp(desv);  
 fclose("all");
end
 
