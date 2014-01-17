% Check whether our calculated real spherical harmonic functions match the
% low-order known ones. This is a sanity check for convention.
%
%   Author: Ying Xiong.
%   Created: Jan 16, 2014.

tol = 1e-10;
nTheta = 101;
nPhi = 201;
lTheta = linspace(0, pi, nTheta);
lPhi = linspace(-pi, pi, nPhi);
[phi, theta] = meshgrid(lPhi, lTheta);

x = cos(phi) .* sin(theta);
y = sin(phi) .* sin(theta);
z = cos(theta);

% Y_{0,0} = 1/2*sqrt(1/pi).
CheckNear(GetRealSphericalHarmonicFcn(0, 0, lTheta, lPhi), ...
          1/2/sqrt(pi)*ones(nTheta, nPhi), tol);

% Y_{1,-1} = 1/2*sqrt(3/pi)*y.
CheckNear(GetRealSphericalHarmonicFcn(1, -1, lTheta, lPhi), ...
          1/2*sqrt(3/pi)*y, tol);

% Y_{1,0} = 1/2*sqrt(3/pi)*z.
CheckNear(GetRealSphericalHarmonicFcn(1, 0, lTheta, lPhi), ...
          1/2*sqrt(3/pi)*z, tol);

% Y_{1,1} = 1/2*sqrt(3/pi)*x.
CheckNear(GetRealSphericalHarmonicFcn(1, 1, lTheta, lPhi), ...
          1/2*sqrt(3/pi)*x, tol);

% Y_{2,-2} = 1/2*sqrt(15/pi)*xy.
CheckNear(GetRealSphericalHarmonicFcn(2, -2, lTheta, lPhi), ...
          1/2*sqrt(15/pi)*x.*y, tol);

% Y_{2,-1} = 1/2*sqrt(15/pi)*yz.
CheckNear(GetRealSphericalHarmonicFcn(2, -1, lTheta, lPhi), ...
          1/2*sqrt(15/pi)*y.*z, tol);

% Y_{2,0} = 1/4*sqrt(5/pi)*(3z^2-1).
CheckNear(GetRealSphericalHarmonicFcn(2, 0, lTheta, lPhi), ...
          1/4*sqrt(5/pi)*(3*z.^2-1), tol);

% Y_{2,1} = 1/2*sqrt(15/pi)*xz.
CheckNear(GetRealSphericalHarmonicFcn(2, 1, lTheta, lPhi), ...
          1/2*sqrt(15/pi)*x.*z, tol);

% Y_{2,2} = 1/4*sqrt(15/pi)*(x^2-y^2).
CheckNear(GetRealSphericalHarmonicFcn(2, 2, lTheta, lPhi), ...
          1/4*sqrt(15/pi)*(x.^2-y.^2), tol);

fprintf('Passed.\n');
