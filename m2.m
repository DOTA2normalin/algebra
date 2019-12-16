A=[1,4,6;4,2,5;6,5,3]

function res=es_simetrico(mat)
  cond=false
  [fi co]=size(mat)
  for i=1:fi  
    for j=1:co
       if (mat(i,j)==mat(j,i))
        cond=true
        break
       endif 
    endfor
  endfor    
  res=cond;
endfunction