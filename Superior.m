function x = Superior(A,b)
  [m,n] = size(A);
  x(n) = b(n) / A(n,n);
  if m != n
    disp("La matriz tiene que ser cuadrada")
  end
  for i=1:1:m
    if A(i,i) == 0
      display("La matriz contiene un 0")
    end
  end
  for i = (n-1):-1:1
    S = b(i);
    for k = i+1: n 
      S = S - A(i,k) * x(k);
    endfor
      x(i) = S/A(i,i);
  endfor
end