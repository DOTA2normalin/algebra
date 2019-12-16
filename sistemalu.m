function x = sistemalu(A,B)
  [L,U]=jordan(A);
  [retval]=triangulosuperior(L,B);
  [res]=trianguloinferior(U,retval);
endfunction