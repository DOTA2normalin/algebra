
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
d=[0;
    0;
    0;
    0];
      
for i=1:4 
  d(i,1)=2*z(i,1);
endfor
disp('d');
disp(d);

e=[0;0;0;0];

for i=1:4
  e(i,1)=x(i,1)+d(i,1);
endfor

disp('e');
disp(e);


f=[0;0;0;0];
function multi(A,e,f)
  for i=1:4
    for j=1:4
      f(i,1)=f(i,1)+A(i,j)*e(j,1);
    endfor
  endfor
  disp(f);
endfunction
disp('f');
multi(A,e,f);


