a=[1,4;-2,5;3,-1;4,1]

function [res]=progresio(A)
  [fi co] = size(A)
  for i=1:fi
    B(i,1)=1
    B(i,2)=A(i,1)
    C(i,1)=A(i,2)
  endfor
  for a=1:fi
    for b=1:co
      TA(b,a)=B(a,b)
    endfor
  endfor
  M=TA*B
  [f c]=size(M)
  for i=1:f
    for j=1:c
      ad(i,j)=-M(j,i)
      if(i==1 && j==1)
        ad(i,j)=M(i+1,j+1)
      endif
      if(i==2 && j==2)
        ad(i,j)=M(i-1,i-1)
      endif
    endfor
  endfor
  for q=1:1
    s=M(q,q)*M(q+1,q+1)
    for w=2:c
      c=M(q,w)*M(w,q)
    endfor
  endfor
  d=s-c;
  Z=TA*C;
  H=ad*Z
  [filas colu]=size(H)
  for i=1:filas
    for j=1:colu
      Y(i,j)=H(i,j)/d
    endfor
  endfor
  res=Y
endfunction
progresio(a)
