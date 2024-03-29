function [V, D] = USER_EIG(A)
    N = size(A,1);
    U = eye(N);
    
    for kk = 1:20000
        [Q, F] = QR_iter(A);
        A = F * Q;
        U = U * Q;
    end
    
    D = zeros(N);
    tolerance = 1e-5;
    b = 0;
    
    for ii = 1:N-1
        if (abs(A(ii+1, ii)) < tolerance)
            D(ii,ii) = A(ii, ii);
        else
            discr = (A(ii,ii)+A(ii+1, ii+1))^2-4*(A(ii,ii)*A(ii+1, ii+1)-A(ii+1,ii)*A(ii, ii+1));
            root1 = (A(ii,ii)+A(ii+1, ii+1)+sqrt(discr))/2;
            root2 = (A(ii,ii)+A(ii+1, ii+1)-sqrt(discr))/2;
            D(ii,ii) = root1;
            D(ii+1, ii+1) = root2;
            ii = ii + 1;
            if(ii == N)
                b = 1;
            end
        end
    end
    
    if(b ~= 1)
        D(N,N) = A(N,N);
    end
    
    V = [];
    
    for ii = 1:N
        V = [V, null(A - eye(N)*D(ii,ii))];
    end
    
    V = U * V;
end