function [L] = laplaceOperator(Nx, Ny, Nz, Lx, Ly, Lz)
% вычисление шага сетки в каждом направлении
hx = Lx/(Nx+1); hy = Ly/(Ny+1); hz = Lz/(Nz+1);

% определение размерности пространства
if Nx > 1 && Ny > 1 && Nz > 1 % трехмерный случай
    N = Nx*Ny*Nz;
    I = reshape(1:N, [Nx, Ny, Nz]);
    Ix = circshift(I, [-1, 0, 0]) - 2*I + circshift(I, [1, 0, 0]);
    Iy = circshift(I, [0, -1, 0]) - 2*I + circshift(I, [0, 1, 0]);
    Iz = circshift(I, [0, 0, -1]) - 2*I + circshift(I, [0, 0, 1]);
    L = sparse(N, N);
    L = L + spdiags(reshape(Ix/hx^2, [N, 1]), 0, N, N);
    L = L + spdiags(reshape(Iy/hy^2, [N, 1]), 0, N, N);
    L = L + spdiags(reshape(Iz/hz^2, [N, 1]), 0, N, N);
elseif Nx > 1 && Ny > 1 % двумерный случай
    N = Nx*Ny;
    I = reshape(1:N, [Nx, Ny]);
    Ix = circshift(I, [-1, 0]) - 2*I + circshift(I, [1, 0]);
    Iy = circshift(I, [0, -1]) - 2*I + circshift(I, [0, 1]);
    L = sparse(N, N);
    L = L + spdiags(reshape(Ix/hx^2, [N, 1]), 0, N, N);
    L = L + spdiags(reshape(Iy/hy^2, [N, 1]), 0, N, N);
else % одномерный случай
    N = Nx;
    I = 1:N;
    L = sparse(N, N);
    L = L + spdiags(reshape([-1/hx^2 2/hx^2 -1/hx^2], [N, 1]), [-1, 0, 1], N, N);
end

end
