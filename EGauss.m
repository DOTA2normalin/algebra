Matriz=[2,4,6,18;4,5,6,24;3,1,-2,4];

function U = EGauss (Matriz)
  [n,r] = size(Matriz)
  m = eye(n);
  for k=1:(n-1)
    for i=k+1:n
      m(i,k) = Matriz(i,k)/Matriz(k,k);
      for j=(k+1):(n+1)
        Matriz(i,j) = -m(i,k) * Matriz(k,j) + Matriz(i,j);
      end
      Matriz(i,k) = 0;
    endfor
  end
  U = Matriz(1:n,1:n);
  L = m;;
  L*U
  triangulosuperior(U,Matriz(1:n,r));
endfunction