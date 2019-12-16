A=[1,4,6;4,2,5;6,5,3]

function res=es_simetrico(mat)
  cond=true
  [fi co]=size(mat)
  for i=2:fi  
    for j=2:co
       if (mat(i,j)!=mat(j,i))
        cond=false
        break
       endif 
    endfor
  endfor    
  res=cond;
endfunction

function res=det(mat)
  es=true
  [fi co]=size(mat)
  for i=1:fi
    if(det(mat(1:i,1:i))<0)
      es=false
    endif
  endfor
  res=es
endfunction