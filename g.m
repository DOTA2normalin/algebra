A=[1,1,6;-1,2,9;1,-2,3];

function gauss(A)
  [n r]=size(A)
  m=eye(n);
  for k=1:(n-1)
    for i=k+1:n
      m(i,k)=A(i,k)/A(k,k);
      for j=(k+1):(n+1)
        A(i,j)=-m(i,k)*A(k,j)+A(i,j);
      endfor
      A(i,k)=0;
    endfor
  endfor  
  U = A(1:n , 1:n)
  L = m
  L * U
  %Presentamos la solucion del sistema usando la funcion sustitucion regresiva
  triangulosuperior(U , A(1:n,r))
endfunction
