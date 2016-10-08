function [seno,coseno] = cordic_func( n , z0 )
%%%% INSTANCIACION DE LA FUNCION [seno, coseno] = cordic_func( 16 , 0.5 )
  format long;
  %---------------------------------------------------------------------------
  %Entradas:
  %n=cantidaddeiteracionesquesedeseanrealizar.
  %z0=angulodeentradaquesedeseacalcularelsinycos.
  %Salidas:
  %seno=senodelangulobetadeentrada.
  %coseno=cosenodelangulobetadeentrada.
  %---------------------------------------------------------------------------
  %Primeroseaseguraqueelangulodeentradaesteenlaprimerarotacion,y
  %cambialosvaloresolosdesplazaparaqueobtenganvaloresentre-pi<z0<=pi
  %envezde0<z0<=2pi.Sielanguloestaentre0ypisemeantienesuvalor,
  %siseencuentraentrepiy2piserotasuvalorparaqueseubiqueentre0y-pi.

  z0=z0*(pi/180);
  shiftflag=1;
  Regionflag=0;
  alpha=0;
  if(z0<-pi)
    alpha=-pi-mod(-pi-z0,2.0*pi)+2.0*pi;
  else
    alpha=-pi+mod(z0+pi,2.0*pi);
  end
  %---------------------------------------------------------------------------
  %Seguido seasegura de que el angulo a calcular este entre el rango de -pi/2 y
  %pi/2 ,ya que es el rango de en que el algoritmo CORDIC calcula el valor del
  %seno y coseno del angulo de entrada.

  if(alpha<-pi/2)
    alpha=alpha+pi/2;
    shiftflag=-1;
    Regionflag=-1;
  elseif(alpha>pi/2)
    alpha=alpha-pi/2;
    shiftflag=-1;
    Regionflag=1;
  else
    shiftflag=1;
    Regionflag=0;
  end
  %---------------------------------------------------------------------------
  %Despues de desplazar elanguloalrangodeseado,seprocedealcalculodelas
  %cosntantesatan(2^(-i)),dondei=0,1,2,...,n-1;dondeneslacantidaddeitera-
  %cionesarealizarporelprograma.
  fid=fopen('LUT.txt','w');
  for(j=1:1:n)
    Angles(1,j)=atan(2^(1-j));
    fprintf(fid,'%s\n',num2hex(single(Angles(1,j))));
  end
  fclose(fid);
  %---------------------------------------------------------------------------
  %Seprocedeacalcularlaconstantedecorreciondelamagnituddelasvariables
  %desalida.Porlogeneralestevalorescercanoa0.6072.
  K=1;
  for(j=0:1:n-1)
    K=K*(1/sqrt(1+2^(-2*j)));
  end
  
  %---------------------------------------------------------------------------
  %SeprocedeacalcularelsenoyelcosenomedianteelalgoritmoCORDIC.
  Xi=K;
  Yi=0;
  Zi=alpha;
  File_Inter=fopen('IntermediateResults_CORDIC.txt','w');
  for(i=0:1:n-1)

    fprintf(fid,'%s %s %s\n',num2hex(single(Xi)), num2hex(single(Yi)), num2hex(single(Zi)));
    if(Zi<0)
      sigma=-1;
    else
      sigma=1;
    end
    Xi1=Xi-sigma*Yi*2^(-i);
    Yi1=Yi+sigma*Xi*2^(-i);
    Zi1=Zi-sigma*Angles(1,i+1);
    
    Xi=Xi1;
    Yi=Yi1;
    Zi=Zi1;
    disp ("The value of Xi is:"), disp(Xi);
    disp ("The value of Yi is:"), disp(Yi);
    disp ("The value of Zi is:"), disp(Zi);
  end
  fclose(File_Inter);
  %---------------------------------------------------------------------------
  %Acontinuacionseprocedearevisarelvalordelasbanderasdedesplazamientoyde
  %region,paraidentificarsihayquerealizarunintercambioenlassalidas.
  if(shiftflag==-1)
  if(Regionflag==1)
    Temp=Xi;
    Xi=-Yi;
    Yi=Temp;
  elseif(Regionflag==-1)
    Temp=Xi;
    Xi=Yi;
    Yi=-Temp;
  else
    Xi=Xi;
    Yi=Yi;
  end
  else
    Xi=Xi;
    Yi=Yi;
  end
  %---------------------------------------------------------------------------
  %SeprocedeaajustarelvalordelasvariablesXiyYimultiplicandolasporla
  %constanteK,paraobtenerelvalorcorrecto.
  coseno=Xi;
  seno=Yi;

endfunction

%%%% INSTANCIACION DE LA FUNCION [seno, coseno] = cordic_func( 16 , 0.5 )
