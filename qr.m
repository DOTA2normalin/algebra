function res=norma(vector)
   res=1;  
   for(i=1:3)
      res=res+vector(i)*vector(i)  
   endfor   
endfunction 

function gs(a,b,c)
   q1=(1/norma(a))*(a)
endfunction  