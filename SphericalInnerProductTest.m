%   Author: Ying Xiong.
%   Created: Jan 16, 2014.

tol = 1e-10;
nTheta = 101;
nPhi = 201;

l1 = 3;
m1 = -2;

l2 = 5;
m2 = 1;

F = GetSphericalHarmonicFcn(l1, m1, nTheta, nPhi);
G = GetSphericalHarmonicFcn(l2, m2, nTheta, nPhi);

CheckNear(SphericalInnerProduct(F, F), 1, tol);
CheckNear(SphericalInnerProduct(F, G), 0, tol);

fprintf('Passed.\n');
