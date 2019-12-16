x=[4,-8,1];
y=[3,4,12];

disp('x= ');
disp(x);
disp('y= ');
disp(y);

function angulo(x,y)
  m=0;
  for i=1:3
    m=m+x(i)*y(i);
  endfor
  
  a=0;
  for i=1:3
    a=a+x(i)*x(i);
  endfor
  sqrt(a);
  
  
  b=0;
  for i=1:3
    b=b+y(i)*y(i);
  endfor
  sqrt(b);
  
  
  valor=0;
  
  valor=a/b;
  disp(valor);

endfunction

angulo(x,y);
