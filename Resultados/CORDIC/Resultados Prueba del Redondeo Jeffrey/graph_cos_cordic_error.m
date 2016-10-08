    Exp_FLM00=load("FLMvsTeorico_RMODE00.txt");
    Exp_FLM01=load("FLMvsTeorico_RMODE01.txt");
    Exp_FLM10=load("FLMvsTeorico_RMODE10.txt");
    %h1=figure();
    %plot(n,Exp_FLM);
    plot(n,Exp_FLM00,'.b',n,Exp_FLM01,'r',n,Exp_FLM10,'r');
    %axis ([1, 890], "normal");
    xlabel ("n");
    ylabel ("Porcentaje error");
    legend ("Teorico", "Primera version");
    grid ("on");
    #print(h1, 'Prcentaje error  32.eps', '-portrait');
    print -depsc -portrait Porcentaje_error_mult_simple.eps