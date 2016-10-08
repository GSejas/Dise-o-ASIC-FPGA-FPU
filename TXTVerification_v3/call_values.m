function call_values(name1, name2, n, oper, typ)
  file_id1=fopen(name1, 'w');
  file_id2=fopen(name2, 'w');
  
  file_id3=fopen("Decimal_R.txt", 'w');
  file_id4=fopen("Hexadecimal_R.txt", 'w');
  
  %file_angle=fopen("COS_Files/Input_angles.txt", 'w');

%##LE AGREGAMOS 
	%if (oper==0) 
	  %rfile_add="ADD_SUB_Files"; 	#SUMA
	%elseif oper==1
	  %rfile_add="ADD_SUB_Files"; 	##RESTA
	%elseif oper==2
	  %rfile_add="MULT_Files"; 	#MULTIPLICACION
	%elseif oper==3
	  %rfile_add="COS_Files";   #COSENO
	%elseif oper==4
	  %rfile_add="SIN_Files"; 	#SENO
	%endif


 
%###############CONCATENAMOS EL STRING DEL PATH CON EL ARCHIVO DE LA OPERACION ###############
	%if (oper == 0) | (oper == 1) | (oper == 2) 
		%#CONCATENATION
		%file_path_operand1  = strjoin ({rfile_add,name1}, '/');
		%file_path_operand2  = strjoin ({rfile_add,name2}, '/');
		%file_path_operand1_h  = strjoin ({rfile_add,"Hexadecimal_A.txt"}, '/');
		%file_path_operand2_h  = strjoin ({rfile_add,"Hexadecimal_B.txt"}, '/');
		
		%#FILE OPENING
		%file_id1=fopen(file_path_operand1, 'w');
		%file_id2=fopen(file_path_operand2, 'w');
		%file_id1_h=fopen(file_path_operand1_h, 'w'); 
		%file_id2_h=fopen(file_path_operand2_h, 'w');
	%else 
		%#CONCATENATION
		%file_path_angle  = strjoin ({rfile_add,"input_angles.txt"}, '/');
		%file_path_angle_h  = strjoin ({rfile_add,"input_angles_hex.txt"}, '/');
		
		%#FILE OPENING
		%file_angle=fopen(file_path_angle, 'w');
		%file_angle_h=fopen(file_path_angle_h, 'w');
	%endif
	
	%#ACA ABRIMOS O CREAMOS EL ARCHIVO DECIMA O HEXADECIMAL
	%file_path_dec_reslt = strjoin ({rfile_add,"Decimal_R.txt"}, '/');
	%file_path_hex_reslt = strjoin ({rfile_add,"Hexadecimal_R.txt"}, '/');

	%#HERE WE WRITE TO FILE THE RESULTS
	%file_id3=fopen(file_path_dec_reslt, 'w');
	%file_id4=fopen(file_path_hex_reslt, 'w');
	
	%file_id5= fopen("Decimal_R.txt",     'w');
	%file_id6= fopen("Hexadecimal_R.txt", 'w');


  for i=0:n-1
  
   #calculo del angulo
    angle = rand(1)*(3.14/2);
    ang_exp_num=rand(1);
    if ang_exp_num<0.5
      ang_exp_num=1;
    else
      ang_exp_num=-1;
    endif

  #Calculo valor 1
    
    num1=rand(1);
    num2=rand(1)*i;
    num3=1+rand(1);
    exp_num=rand(1);
    if exp_num<0.5
      exp_num=1;
    else
      exp_num=-1;
    endif
   #Calculo valor 2
    bnum1=rand(1);
    bnum2=rand(1)*i;
    bnum3=1+rand(1);
    bexp_num=rand(1);
    if bexp_num<0.5
      bexp_num=1;
    else
      bexp_num=-1;
    endif
    #CALCULO FINAL RARO MANTISSA X EXPONENTE
    
    operand1=exp_num*num1*num2/num3;
    operand2=bexp_num*bnum1*bnum2/bnum3;
    real_ang = ang_exp_num*angle;
    
    #Realizar operacion suma/resta
    if oper==0
      result=operand1+operand2; 	#SUMA
    elseif oper==1
      result=operand1-operand2; 	##RESTA
    elseif oper==2
      result=operand1*operand2; 	#MULTIPLICACION
    elseif oper==3
      result=cos(real_ang); 	#COSENO
    elseif oper==4
      result=sin(real_ang); 	#SENO
    endif
    if typ==0 
      A=num2hex (single (result)); #CONVERTIR A SINGLE
    elseif typ==1
      A=num2hex (result);  #DEJAR COMO DOUBLE
    endif
    
    #Carga a archivos txt
	if (oper == 0) | (oper == 1) | (oper == 2) 
		if typ == 0
			OP_1=num2hex (single (operand1)); #CONVERTIR A SINGLE
			OP_2=num2hex (single (operand2)); #CONVERTIR A SINGLE
		elseif typ == 1
			OP_1=num2hex (operand1); #DEJAR COMO DOUBLE
			OP_2=num2hex (operand2); #DEJAR COMO DOUBLE
		endif
		fprintf(file_id1, "%f\n", operand1);  #IMPRIMIR OPERANDO 1 A DEC
		fprintf(file_id2, "%f\n", operand2);  #IMPRIMIR OPERANDO 2 A DEC
		%fprintf(file_id1_h, "%s\n", OP_1);  #IMPRIMIR OPERANDO 1 A HEX 
		%fprintf(file_id2_h, "%s\n", OP_2);  #IMPRIMIR OPERANDO 2 A HEX
	else 
		if typ == 0
			ang_hex = num2hex (single (real_ang)); #CONVERTIR A SINGLE
		elseif typ == 1
			ang_hex = num2hex (real_ang); #DEJAR EN DOUBLE
		endif
		%fprintf(file_angle, "%f\n", real_ang);  #IMPRIMIR OPERANDO ANGULO
		%fprintf(file_angle_h, "%s\n", ang_hex);  #IMPRIMIR OPERANDO ANGULO A HEX
	endif

    #WRITE RESULTS
    fprintf(file_id3, "%f\n", result);	#IMPRIMIR RESULTADO EN HEXA
    fprintf(file_id4, "%s\n", A); 	#IMPRIMIR RESULTADO EN DECIMAL
    
    
    %fprintf(file_id5, "%f\n", result);	#IMPRIMIR RESULTADO EN HEXA
    %fprintf(file_id6, "%s\n", A); 	#IMPRIMIR RESULTADO EN DECIMAL
  endfor
  fclose("all");
end  
