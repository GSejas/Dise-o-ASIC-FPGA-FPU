function [] = serialcom32(port,BR,n)
pkg load instrument-control;

s1 = serial(port, BR); 
srl_flush(s1)
data = srl_read(s1,n)
datahex = dec2hex(data);

f1=fopen('Result_place_route_mult_FLM.txt','w');
for(j=1 : 4 : n)
      fprintf(f1,'%s', datahex(j,1));
      fprintf(f1,'%s', datahex(j,2));
      fprintf(f1,'%s', datahex(j+1,1));
      fprintf(f1,'%s', datahex(j+1,2));
      fprintf(f1,'%s', datahex(j+2,1));
      fprintf(f1,'%s', datahex(j+2,2));
      fprintf(f1,'%s', datahex(j+3,1));
      fprintf(f1,'%s\n', datahex(j+3,2));     
end
fclose(f1);
hex2float('Result_place_route_mult_FLM.txt','Result_Calc_sin_dec_FPGA.txt',1024,32);
