A=[1,1,3];
function escalar(A)  
  for i=1:3
    A(i)=7*A(i);
  endfor
  disp(A);
endfunction
escalar(A);