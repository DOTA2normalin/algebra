function [L,U]=cho()
  A=[1 2 3;4 5 6;7 8 9];
  b=vectorb();
  n=size(A);
  L=eye(n);
  U=eye(n);
  for i=1:n
    acumulador=0;
    for j=1:n-1
      acumulador=acumulador+(L(i,j)*U(i,j));
    endfor
    L(i,i)=sqrt(A(i,i)-acumulador);
    U(i,i)=L(i,i);
    for k=i+1:n
      acumulador2=0;
      for t=1:n-1
        acumulador2=acumulador2+(L(k,t)*U(t,i));
      endfor
      L(k,i)=(A(k,i)-acumulador2)/L((i+1),(i+1));
    endfor
    for j=1+1:n
      acumulador3=0;
      for k=1:n-1
        acumulador3=acumulador3+L(i,k)*U(k,j);
      endfor
      U(i,j)=(A(i,j)-acumulador3)/L((i+1),(i+1));
    endfor
  endfor
  disp('U=')
  disp(U)
  disp('L=')
  disp(L)
  
endfunction

