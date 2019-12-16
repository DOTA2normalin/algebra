x=[-6,3,2];
y=[-8,5,1];

disp('x= ');
disp(x);
disp('y= ');
disp(y);

function vectores(x,y)
  disp('7 * y=');
  a=[0,0,0];
  for i=1:3
    a(i)=7*y(i);
  endfor
  disp(a);


  disp('4 * x=');
  b=[0,0,0];
  for i=1:3
    b(i)=7*x(i);
  endfor
  disp(b);

  disp('a-b');
  c=[0,0,0];
  for i=1:3
    c(i)=a(i)-b(i);
  endfor
  disp(c);


  disp('la norma es igual= ');

  m=0;
  for i=1:3
    m=m+x(i)*x(i);
  endfor

  sqrt(m);
  disp(m);
endfunction


vectores(x,y);

