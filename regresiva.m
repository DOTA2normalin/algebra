A=[1,1,6,7;-1,2,9,2;1,-2,3,10];
disp(A);
b=[

function [x]=regresivas(A,b)
[f,c]=size(A);
if f~=c
    error('la matriz de coeficientes no es cuadrada')
end
x=zeros(f,1);
for i=f-1:-1:1
    x(i)=b(i);
    for j=i+1:f
        x(i)=x(i)-A(i,j)*x(j); %es aquí donde me refiero que deberías tener un menos, y no un más.
    end
    x(i)=x(i)/A(i,i);
end