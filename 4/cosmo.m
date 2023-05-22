function [W, Ws, sg] = cosmo(XYZ, Q, P, S, e_in)

RDist = rev_dist(P, XYZ);
QRDist = rev_dist(XYZ, XYZ);
SRDist = rev_dist(P, P);

A = SRDist .* S';
b = -1 / e_in * RDist' * Q;
sg = A \ b;

q = sg .* S;
Ws = 0.5 * Q' * RDist * q;

Wq = 0.5 * Q' * QRDist * Q;
W = Ws + Wq;

end

function M = rev_dist(A, B)
D = pdist2(B, A);
M = 1 ./ D;
M(D == 0) = 0; 
end
