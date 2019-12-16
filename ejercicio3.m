x=[-5,7,2];
y=[4,1,6];

disp('x= ');
disp(x);
disp('y= ');
disp(y);

function n = ortogonales(x,y)
  m=0;
  for i=1:3
    m=m+x(i)*y(i);
  endfor
  n=m;
  disp(n);
endfunction

ortogonales(x,y);