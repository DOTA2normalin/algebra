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
      
      
function az(A,z,d)
  for i=1:4
    for j=1:4
      d(i,1)=d(i,1)+A(i,j)*z(j,1);
    endfor
  endfor
  disp(d);
endfunction

disp('d');
az(A,z,d);