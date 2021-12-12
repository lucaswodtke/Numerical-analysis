 %f(x) = cos(x)    , [0, +pi/2]  ,  erro até 1e-4
     A = 0;
     B = pi/2;
     
     printf("\n1) Interpolação Polinomial: \n");
     grau = 4
     h = (B-A)/grau;
     
     x = A : h : B;
    y = cos(x);
    aux = pi/4;
    xp1= xp1 = A : h/20 : B;
    yp = fPnGeral(grau,x,y,xp1);
    
    ye =cos(xp1);
    erro = abs(yp .- ye);
    erroMax = max(erro)
    
    %plot(xp1,yp,x,y,'*',2.2,0);
    
    printf("\n2) Interpolação Spline Cubica: \n");
    grau = 20
    h = (B-A)/grau;
    
    x = A : h : B;
    y = cos(x);
    
    [a b c d] = fSplineb(grau,x,y);
    np = 4;
    xpp=[];ypp=[];
    for i = 1 : grau
        xs = x(i) : (x(i+1)-x(i)) / np : x(i+1);
        for k = 1 : np + 1
            ys(k) = a(i)*(xs(k)-x(i))*(xs(k)-x(i))*(xs(k)-x(i))+b(i)*(xs(k)-x(i))*(xs(k)-x(i))+c(i)*(xs(k)-x(i))+d(i);
        end
        xpp = [xpp xs];
        ypp = [ypp ys];
    end
    yep = exp((-xpp) .* xpp);
    
    erroS = abs(ypp .- yep);
    erroSpline=max(abs(ypp.-yep))
    
    %plot(x,y,"*",xpp,ypp,'--b','LineWidth',1)
    printf("\n3) Curvas de Bezier: \n");
    
    m = 16
    grau = m;
    h = (B - A) / m;
    x = A : h : B;
    y =  cos(x);
    [xx yy] = fBezier(m,x,y);
    yep =  cos(xx);
    erroBezier = abs(yy .- yep);
    erroB = max(abs(yy.-yep))
    %plot(x,y,'*',xx,yy,2.2,0);
    
    %Fim Bezier
    tp = -1 : 0.1 : 1;
    xp = 0.5 .* (B - A) .* tp .+ 0.5 .* (B + A);
    ye = cos(tp/4*pi + pi/4);
    a = [1 0 (-1) 0 (1/2) 0 (-1/6) 0 (1/24) 0 (-1/factorial(5)) 0 (1/factorial(6))];
    
    printf("\n4) Serie de Maclaurin: \n");
    grau = 12
    
    
    yMc = fPnValorBaseCanonica(tp,grau,a);
    
    erroMc = abs(yMc .- ye);
    erroMcMax = max(erroMc)
    %plot(xp, yMc, '-r', 2.2, 0);
    
    printf("\n5) Serie de Maclaurin-Tchebyschev \n");
    grau = 3
    b = fcoefTchebychev(grau);
    yTC = fcalculaTchebychev(grau,b,tp);
    
    erroTc = abs(yTC .- ye);
    erroTcMax = max(erroTc)
    
     %plot(xp, yTC, xp,ye,'*', 2.2, 0);
     
     
     printf("\n6) Aproximação de Padé: \n");
     n = 5
     m = 4
     M = n + m
     
     c = fcoefMaclaurin(M);
     
     [a b] = fPade(n,m,c);
     
     yPade = fPnValorBaseCanonica(tp, n, a) ./ fPnValorBaseCanonica(tp, m, b);
     
     erroPade = abs(yPade .- ye);
     erroPadeMax = max(erroPade)
     
     printf("\n A  aproximação mais eficiente foi a Serie de Maclaurin-Tchebyschev  \n");
    
    %plot(xp,ye,'*',xp,yPade);
    
    %GRAFICO ERROS INTERPOLAÇÕES
    %plot(xpp,erroS,'--r',xp1,erro,'--b');
    
    %GRAFICO ERROS SERIES
    %plot(xp,erroPade,'-g',xp,erroTc,'-b',xp,erroMc,'-r');
    
    %GRAFICO ERRO SERIES + INTERPOLAÇÕES
    plot(xp,erroPade,'-g',xp,erroTc,'-b',xp,erroMc,'-r',xpp,erroS,'--r',xp1,erro,'--b');

	 	  	 	     	 	    	      	 	     	  	 	
