function var=simetrico(A)
  es=true;
  [fi co]=size(A)
  for i=1:fi
    for j=1:co
      if (A(i,j)!=A(j,i))
        es=false;
        break;
      endif
    endfor
  endfor
  var=es;
endfunction

function var=determinante(A)
  es=true;
  [fi co]=size(A)
  for i=1:fi
    if(det(A(1:i,1:i))<0)
       es=false;
       disp("determinante negativo")
    endif
   endfor
  var=es;
endfunction
function [R] = s(A)
      n=size(A)
    % Check that A is positive definite
    for i=1:n
      if (A(i, i) <= 0)
        disp("The matrix is not positive definite.");
        return;
      endif
    endfor

    % Create the empty R matrix
    R = zeros(n);

    % Fill the R matrix
    for i=1:n
      for j=1:n
        if(i == j)
          squares = 0;
          for k=1:j-1
            squares = squares + (R(j,k))^2;
          endfor
          R(j,j) = sqrt(A(j,j) - squares);
        elseif(i > j)
          summation = 0;
          for k=1:j-1
            summation = summation+ R(i,k)*R(j,k);
          endfor
          R(i,j) = ((A(i,j)-summation)/(R(j,j)));
        endif
      endfor
    endfor

    % We actually want the upper triangular version of R
    % So just redifine R as its transpose
    R = R';

    % Check that R is upper triangular
    if(istriu(R) != 1)
      disp("R is not upper triangular.");
      return;
    endif 

endfunction