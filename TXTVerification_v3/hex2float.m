function [] = hex2float(dir1,dir2,n,prec)
format long

f1=fopen(dir1,'r');
f2=fopen(dir2,'w');

for(j=1 : 1 : n)
  if(prec == 32)
    num = hex2num(fgetl(f1),"single");
  else
    num = hex2num(fgetl(f1));
  endif
    
  fprintf(f2,'%.30f\n',num);  
end

fclose(f1);
fclose(f2);