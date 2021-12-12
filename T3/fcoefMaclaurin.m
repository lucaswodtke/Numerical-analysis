 function c=fcoefMaclaurin(grau)
    aux = pi/4;
    c(1) = cos(aux)
    for i=1:grau
        c(i+1) = aux**(i-1)*1/factorial(i-1)*c(1)*(-1)**((i*i+i)/2);
    end
    end