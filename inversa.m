
function m_matrix=escalonadoInferior(A)
    m_matrix=A;
    [m_row m_col]=size(A);
    for j=1:(m_row-1)
      % max_val elemento pivote
      max_val=m_matrix(j,j);
      max_file=j;
      for x=(j+1):m_row
        % hallando el valor maximo para q sea pivote */
        if(max_val<abs(m_matrix(x,j)))
          max_val=m_matrix(x,j);
          max_file=x;
        endif
      endfor
      % donde esta la fila con el valor q va ser pivote
      % se lo lleva para arriba
      if(j!=max_file)
        m_matrix=swapRow(m_matrix,j,max_file);
      endif
      % f1=f1-mf2
      % m21=a21/a11;
      for i=(j+1):m_row
        m=m_matrix(i,j)/m_matrix(j,j);
        for k=1:m_col
          m_matrix(i,k)=m_matrix(i,k) - m*m_matrix(j,k);
        endfor
      endfor
    endfor
endfunction


function contador=rango(A)
  C=A;
  [m_row m_col]=size(A);
  verdad=true; %empieza con q es fila nula
  contador=m_row;
  C=escalonadoInferior(C);
  for i=1:m_row
    for j=1:m_col
      if(C(i,j)!=0); %apenas haye un numero en la fila 
        verdad=false;
      endif
    endfor
    if(verdad)
      contador=contador-1;
    endif
    verdad=true;
  endfor
endfunction

function X=swapRow(A,f1,f2)
  X=A;
  if(f1>length(A(:,1)) || f2>length(A(:,1)))
    error("las filas no se pueden intercambiar \n");
  else
    %X(f1,:)=A(f2,:);
    %X(f2,:)=A(f1,:);
    for j=1:length(X(1,:))
      X(f1,j)=A(f2,j);
      X(f2,j)=A(f1,j);
    endfor
  endif
endfunction

function inv=inversa(matrix)
  [m_row m_col]=size(matrix);
  if(m_row==m_col)
    filas_no_nulas=rango(matrix);
    if(filas_no_nulas==m_row)
      A=matrix;
      inv=eye(m_row,m_col);
      %escalonamiento inferior 000
      for j=1:(m_row-1)
          max_val=A(j,j);
          max_file=j;
          %identificacion del mayor valor en la columna j
          for x=(j+1):m_row
              if(max_val<A(x,j))
                  max_val=A(x,j);
                  max_file=x;
              endif
          endfor
          %en el caso q el elemento pivote sea cero
          %hallamos el valor mas negativo
          if(max_val==0)
            for x=(j+1):m_row
              if(max_val>A(x,j))
                max_val=A(x,j);
                max_file=x;
              endif
            endfor
          endif
          if(j!=max_file)
              A=swapRow(A,j,max_file);
              inv=swapRow(inv,j,max_file);
          endif
          %Resta de Filas para escalonar
          for i=(j+1):m_row
              m=A(i,j)/A(j,j);
              for k=1:m_col
                  A(i,k)=A(i,k) - m*A(j,k);
                  inv(i,k)=inv(i,k) - m*inv(j,k);
              endfor
          endfor
      endfor
      % igualando a 1 la diagonal principal
      for i=1:m_row
          max_val=A(i,i);
          for j=1:m_col
              A(i,j)=A(i,j)/max_val;
              inv(i,j)=inv(i,j)/max_val;
          endfor
      endfor
      %escalonamimento superior 000
      for j=m_row:-1:2
          for i=(j-1):-1:1
              m=A(i,j)/A(j,j);
              for k=1:m_col
                  A(i,k)=A(i,k) - m*A(j,k);
                  inv(i,k)=inv(i,k) - m*inv(j,k);
              endfor
          endfor
      endfor
    else
      printf("no tiene inversa dado que tiene filas nulas \n");
    endif
  else
    printf("dimensionalmente incorrecto \n");
  endif
endfunction
