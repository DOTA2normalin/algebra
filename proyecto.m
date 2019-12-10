clear,clc
f = input("Digite la fila de la matriz: ")
c = input("Digite la columna de la matriz: ")
A = zeros(rows(f),columns(c))
for i=1:f
  for j=1:c
	% pedir datos como matriz %       
	  A(i,j) = input("Digite el elemento ")	     
  endfor
endfor
disp(A)
disp("Bienvenido al programa calculadora de matrices")
disp ("1: Calcula la determinante")
disp ("2: Calcula LU")
disp ("3: Calcula QR")
disp ("4: Calcula la inversa")
disp ("5: Calcula Algoritmo Leverrier")
disp ("6: Calcular si la matriz es cholesky")
disp ("7: Calcular la descomposicion Cholesky")
disp ("8: Calcular Gauss")
disp ("9: Calcular GrandSmith")
disp ("10: Fin del programa")
x = input("Digite un numero del 1 al 10: ")
switch x
      case 1
          disp("Calcula la determinante")
          disp(A)
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
          % determinante
          function det=determinante(A)
              m_matrix=A;
              [row m_col]=size(A);
              
              n=0;  
              det=1;
              for j=1:(row-1)
                % max_val elemento pivote
                max_val=m_matrix(j,j);
                max_file=j;
                for x=(j+1):row
                  % hallando el valor maximo para q sea pivote */
                  if(max_val<abs(m_matrix(x,j)))
                    max_val=abs(m_matrix(x,j));
                    max_file=x;
                    n=n+1; % es para (-1)^n
                  endif
                endfor
                % donde esta la fila con el valor q va ser pivote
                % se lo lleva para arriba
                if(j!=max_file)
                  m_matrix=swapRow(m_matrix,j,max_file);
                endif
                % f1=f1-mf2
                % m21=a21/a11;
                for i=(j+1):row
                  m=m_matrix(i,j)/m_matrix(j,j);
                  for k=1:m_col
                    m_matrix(i,k)=m_matrix(i,k) - m*m_matrix(j,k);
                  endfor
                endfor
              endfor
              for i=1:row
                det=det*m_matrix(i,i);
              endfor
              det=det*(-1)^n;  
          endfunction

          disp(determinante(A))
      case 2
          disp("calcula LU");
          disp(A)
          b=zeros(rows(f),columns(1));
          for i=1:f;
            for j=1:1
              d(i,j)=input (" Digite un numero para la matriz b ")
            endfor
          endfor

          
          tipo=input('Seleccione el método a utilizar (Doolittle 1, Crout 2):');

          function [  ] = factorizacionLU (tipo,A,b)
              n=size(A);

              if tipo=1
                for i=1:n
                  U(1,i)=A(1,i);
                endfor
                
                for j=1:n
                  L(j,1)=A(j,1)/U(1,1);
                endfor
              elseif tipo=2
                for i=1:n
                  L(i,1)=A(i,1);
                endfor
                
                for j=1:n
                  U(1,j)=A(1,j)/L(1,1);
                endfor
              endif

              for k=2:n
                for t=k:n
                  Acumulador=0;
                    for q=1:k-1
                      Acumulador=Acumulador+(L(k,q)*U(q,t));
                    endfor
                  if tipo=1
                    U(k,t)=(A(k,t)-Acumulador);
                  elseif tipo=2
                    L(t,k)=(A(t,k)-Acumulador);
                  endif
                endfor
                
                for r=i:n
                  Acumulador2=0;
                    for y=1:k-1
                      Acumuluador2=Acumulador2+(L(r,y)*U(y,k));
                    endfor
                  if tipo=1
                    L(r,k)=(A(r,k)-Acumulador2)/U(k,k);
                  elseif tipo=2
                    U(k,r)=(A(k,r)-Acumulador2)/L(k,k);
                  endif
                endfor
              endfor

              disp('U=') 
              disp (U) 
              disp('L=') 
              disp (L)


          endfunction

          disp(factorizacionLU(tipo,A,b))
      case 3
          disp("Calcula QR");
          disp(A)
          function [Q R]=descomposicionQR(A)
            [f c]=size(A);
            Q=zeros(f,c);
            R=zeros(c,c);
            for i=1:c
              v=A(:,i);
              combinacionLineal=zeros(f,1);
              for j=1:(i-1)
                u=Q(:,j);
                R(j,i)=sum(v.*u);
                combinacionLineal=combinacionLineal+R(j,i)*u;
              endfor
              Wi=v-combinacionLineal;
              R(i,i)=sqrt(sum(Wi.*Wi));
              Q(:,i)=Wi/R(i,i);
            endfor
          endfunction

          disp(descomposicionQR(A))
      case 4
          disp("Calcula la inversa");
          
          disp(inversa(A))
          
          
      case 5
          disp("Calcula Algoritmo Leverrier")
          disp(A)
          function p=polinomio(A)
            [n m]=size(A);
            if (n==m)
              p=zeros(1,n); #vector de coef del polinomio
              Mi=I=eye(n);
              for i=1:n
                T=A*Mi; #matriz para sumar su diagonal principal
                p(i)=(-1/i)*trace(T);
                Mi=T+p(i)*I;
              endfor
              p=[1 p];
            else
              error("no es una matriz cuadrada")
            endif
          endfunction
          function [V D]=algoritmoLeverrier(A)
              poli=polinomio(A);
              n=length(A);
              raiz=roots(poli);
              B=zeros(n);
              C=-1.*A(2:n,1); %columna de A
              D=diag(raiz); %valores propios en la matriz diagonal
              V=zeros(n);
              S=zeros(n,1); %vector propio
              for i=1:length(D)
                  B=A(2:n,2:n)-D(i,i)*eye(n-1); %submatriz de A
                  S=[1 (B\C)'];
                  % vectores propios normalizados
                  % cada vector propio es una columna de V
                  V(1:n,i)=S/norm(S);
              endfor
          endfunction

          disp(algoritmoLeverrier(A))
      case 6
          disp("Calcular si la matriz ingresada es cholesky")
          disp(A)
          function verdad=simetria(A)
            [m_row m_col]=size(A);
            verdad=true;
            for i=1:m_row
              for j=(i+1):m_col
                if(A(i,j)!=A(j,i))
                  verdad=false;
                  break;
                endif
              endfor
            endfor
          endfunction

          function verdad=cholesky(A)
            [fila col]=size(A);
            verdad=true;
            if (fila!=col)
              error(" tiene que ser una matriz cuadratica \n");
            else
              if(simetria(A))
                for i=1:fila
                  if (det(A(1:i,1:i))<=0)
                    verdad=false;
                    break;
                  endif
                endfor  
              endif
            endif
          endfunction
          disp(cholesky(A))
      case 7
          disp("Calcular la descomposicion cholesky")
          b=zeros(rows(f),columns(1));
          for i=1:f;
            for j=1:1
              d(i,j)=input (" Digite un numero para la matriz b ")
            endfor
          endfor
          
          function [G,Gt]=Cholesky(A,b)
            if (cholesky(A))
              [m_row m_col]=size(A);
              G=zeros(m_row,m_col);
              G(1,1)=sqrt(A(1,1));
              for i=2:m_row
                for j=1:i
                  if(j==1)
                    G(i,1)=A(i,1)/G(1,1);
                  elseif (i==j)
                    temp=0;
                    for k=1:(i-1)
                      temp = temp + (G(i,k))^2;
                    endfor
                    G(i,i)=sqrt(A(i,i)-temp);
                  else
                    temp=0;
                    for k=1:(j-1)
                      temp=temp + G(i,k)*G(j,k);
                    endfor
                    G(i,j)=(A(i,j)-temp)/G(j,j);
                  endif
                endfor
              endfor
              Gt=G';
            else
              error("no tiene descomposicion de Cholesky \n");
            endif
          endfunction
          disp(Cholesky(A,b))
      case 8
          disp(" Calcular Gauss: ")
          disp(A)
          function [retval] = triangulosuperior(B,A)
            n=length(A);
            retval=zeros(n,1);
            retval(n)=A(n)/B(n,n);
            for k=n-1:-1:1
              retval(k)=(A(k)-B(k,k+1:n)*retval(k+1:n))/B(k,k);
            endfor
            disp(B);

          endfunction



          function gauss(A)
            [n r]=size(A)
            m=eye(n);
            for k=1:(n-1)
              for i=k+1:n
                m(i,k)=A(i,k)/A(k,k);
                for j=(k+1):n
                  A(i,j)=-m(i,k)*A(k,j)+A(i,j);
                endfor
                A(i,k)=0;
              endfor
            endfor  
            U = A(1:n , 1:n)
            L = m
            L * U
            %Presentamos la solucion del sistema usando la funcion sustitucion regresiva
            triangulosuperior(U , A(1:n,r))
          endfunction
          gauss(A)
      case 9
          disp("Calcular GrandSmith")
          function G=gramSchmith(A)
            [f c]=size(A);
            G=zeros(f,c);
            for i=1:f
              v=A(i,:);
              combinacionLineal=zeros(1,c);
              for j=1:(i-1)
                u=G(j,:);
                combinacionLineal=combinacionLineal+(sum(v.*u))*u;
              endfor
              Wi=v-combinacionLineal;
              modulo=1/sqrt(sum(Wi.*Wi));
              G(i,:)=modulo*Wi;
            endfor
          endfunction

          disp(gramSchmith(A))
      otherwise  
          disp("Número no valido");
endswitch

    
