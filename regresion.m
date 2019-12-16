input=[1,2;2,5;6,2;4,3]

function res=regresion(A)
  [fi co] = size(A)
  for i=1:fi
    B(i,1)=1
    B(i,2)=A(1,i)
  endfor
  res=B
endfunction

regresion(input)




