A=[2,9,-23,0;
  0,4,-12,4;
  7,5,-1,1;
  7,8,-10,4];
disp('A=');  
disp(A);
b=[34;
  24;
  15;
  33];
disp('b=');   
disp(b);

x=[-5;
  10;
  2;
  2];
disp('x=');  
disp(x);

z=[-2;
  3;
  1;
  0];
disp('z='); 
disp(z);
c=[0;
      0;
      0;
      0];
function multi(A,x,c)
  for i=1:4
    for j=1:4
      c(i,1)=c(i,1)+A(i,j)*x(j,1);
    endfor
  endfor
  disp(c);
endfunction
disp('c');
multi(A,x,c);