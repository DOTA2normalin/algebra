a=[0,3,4]
b=[-20,27,11]
c=[-14,-4,-2]
function res=prod_esc(a,b)
  s=0
  for i=1:3
    s=a(1,i)*b(1,i)+s  
  endfor  
  res=s
endfunction

function res=modulo(x)
   a=0
   for j=1:3
      a=a+x(1,j)*x(1,j)  
   endfor
   res=a
endfunction

function [res]=gs(a,b,c)
   [fi co]= size(a)
   %q1
   q=0
   q=modulo(a)
   qa=1/sqrt(q)
   q1=qa*a
   %q2
   qb=b-prod_esc(b,q1)*q1
   qmb=modulo(qb)
   qrb=1/sqrt(qmb)
   q2=qb*qrb
   %q3
   qc=c-prod_esc(c,q1)*q1-prod_esc(c,q2)*q2
   qmc=modulo(qc)
   qrc=1/sqrt(qmc)
   q3=qrc*qc
   %Q
   Q=zeros(3)
   for i=1:3
     Q(i,1)=q1(1,i)
   endfor
   for i=1:3
     Q(i,2)=q2(1,i)
   endfor
   for i=1:3
     Q(i,3)=q3(1,i)
   endfor
   %R
   R(1,1)=sqrt(q)
   R(2,2)=sqrt(qmb)
   R(3,3)=sqrt(qmc)
   R(1,2)=prod_esc(b,q1)
   R(1,3)=prod_esc(b,q2)
   R(2,3)=prod_esc(c,q3) 
 
endfunction 

gs(a,b,c)
