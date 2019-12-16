X=[1;
  -2;
  3;
  4]
Y=[1;4;9;16]
K=1;
function [z] = minc(X,Y,k)
  [r s] = size(X);
  for i=1:r
    A(i,1) = 1;
    for j=2:(k+1)
      A(i,j) = X(i)^(j-1);
    endfor
  endfor
  z = inverse(transpose(A)*(A))*transpose(A)*Y;
endfunction

minc(X,Y,K)