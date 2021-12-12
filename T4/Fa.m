function Y = Fa(a,x,y)
    aux=a(1).*sin(a(2).+a(3).*x).+a(4).*cos(a(5).+a(6).*x).+a(7).-y;
    Y(1)=sum( aux.*         sin(a(2).+a(3).*x) );
    Y(2)=sum( aux.*   a(1).*cos(a(2).+a(3).*x) );
    Y(3)=sum( aux.*x.*a(1).*cos(a(2).+a(3).*x) );
    Y(4)=sum( aux.*         cos(a(5).+a(6).*x) );
    Y(5)=sum(-aux.*   a(4).*sin(a(5).+a(6).*x) );
    Y(6)=sum(-aux.*x.*a(4).*sin(a(5).+a(6).*x) );
    Y(7)=sum( aux                              );
    Y = transpose(Y);
end