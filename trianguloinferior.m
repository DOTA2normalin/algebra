traing=[1 0 0 0;-2 -2 0 0;-3 8 3 0;4 6 5 4];
result=[1;2;3;4];


function [res] = trianguloinferior(traing,result)
  [fi co]=size(traing);
  if (fi != co)
    disp("No es una matriz cuadrada");
  endif
  x = zeros(rows(result),columns(result));
  x(co)=result(co)/traing(co,co);
  for i=(co-1) : -1: 1
    S=result(i);
    for j=(i+1) : co
      S=S - traing(i,j)*x(j);
    endfor
      x(i)=S/traing(i,i);
  endfor
  disp(x);
  res = x
  
endfunctrianguloinferior(traing,result)

