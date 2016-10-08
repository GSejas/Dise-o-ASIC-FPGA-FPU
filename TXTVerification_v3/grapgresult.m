function grapgresult(typ)
  n=1:1024;
  
  Teorico=load("Decimal_R.txt")
  if (typ==0)
    Exp_FLM=load("FLMvsTeorico.txt")
    %Exp_DRV=load("FLMvsDRV.txt")
    %h1=figure();
    plot(n,Exp_FLM,'.b');
    %plot(n,Exp_FLM,'.b',n,Exp_DRV,'r');
    %axis ([1, 500 ,0, 0.0005], "normal");
    xlabel ("n");
    ylabel ("Porcentaje error");
    legend ("Teorico", "Primera version");
    grid ("on");
    #print(h1, 'Prcentaje error  32.eps', '-portrait');
    print -depsc -portrait Porcentaje_error_mult_simple.eps
    
  else
    Exp_FLM=load("Result_Calc_sin_dec_FPGA.txt")
    h2=figure();
    plot(n,Teorico,'-xb',n,Exp_FLM,'or');
    axis ([1, 100, -50, 60], "normal");
    xlabel ("n");
    ylabel ("Resultado operacion");
    legend ("Teorico", "FPU","location", "northwest");
    grid ("on");
    #print(h2, 'dummy2.eps', '-portrait');
    print -depsc -portrait Implementacion_mult_simple.eps
  endif
  
  fclose("all");
end  
      
