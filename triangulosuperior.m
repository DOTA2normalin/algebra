
function [retval] = triangulosuperior(B,A)
  n=length(A);
  retval=zeros(n,1);
  retval(n)=A(n)/B(n,n);
  for k=n-1:-1:1
    retval(k)=(A(k)-B(k,k+1:n)*retval(k+1:n))/B(k,k);
  endfor
  disp(B);

endfunction