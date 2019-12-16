x=[2,1,3;
  2,3,6;
  5,2,9];

disp("x=");
disp(x);

y=[1,2,3;
  5,2,3;
  -1,5,6];
   
disp("y=");
disp(y);
function multiplicacion(x,y)
  c=[0,0,0;
     0,0,0;
     0,0,0];
  for i=1:3
    for j=1:3
      c(i,j)=c(i,j)+x(i,j)*y(j,i);
    endfor
  endfor
  disp(c);
endfunction

multiplicacion(x,y);