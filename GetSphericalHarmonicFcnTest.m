% Check whether our calculated spherical harmonic functions match the low-order
% known ones. This is a sanity check for convention.
%
%   Author: Ying Xiong.
%   Created: Jan 16, 2014.

%% Check for low-order associated Legendre polynomials.
nSamples = 1001;
tol = 1e-10;
x = linspace(-1, 1, nSamples);

% 0-th order.
P = legendre(0, x);
CheckNear(P(1,:), ones(size(x)), tol);         % P_0^0(x) = 1.

% 1-st order.
P = legendre(1, x);
CheckNear(P(1,:), x, tol);                     % P_1^0(x) = x.
CheckNear(P(2,:), -sqrt(1-x.^2), tol);         % P_1^1(x) = -sqrt(1-x^2).

% 2-nd order.
P = legendre(2, x);
CheckNear(P(1,:), 0.5*(3*x.^2-1), tol);        % P_2^0(x) = 1/2*(3x^2-1).
CheckNear(P(2,:), -3*x.*sqrt(1-x.^2), tol);    % P_2^1(x) = -3x*sqrt(1-x^2).
CheckNear(P(3,:), 3*(1-x.^2), tol);            % P_2^2(x) = 3(1-x^2).

%% Check for low-order spherical harmonic functions.
nTheta = 101;
nPhi = 201;
lTheta = linspace(0, pi, nTheta);
lPhi = linspace(-pi, pi, nPhi);
[phi, theta] = meshgrid(lPhi, lTheta);

% Y_0^0(\theta, \phi) = 1/2*sqrt(1/pi).
CheckNear(GetSphericalHarmonicFcn(0, 0, lTheta, lPhi), ...
          1/2/sqrt(pi)*ones(nTheta, nPhi), tol);

% Y_1^{-1}(\theta, \phi) = 1/2*sqrt(3/2/pi)*sin(\theta)*e^(-i\phi).
CheckNear(GetSphericalHarmonicFcn(1, -1, lTheta, lPhi), ...
          1/2*sqrt(3/2/pi)*sin(theta).*exp(-1i*phi), tol);

% Y_1^0(\theta, \phi) = 1/2*sqrt(3/pi)*cos(\theta).
CheckNear(GetSphericalHarmonicFcn(1, 0, lTheta, lPhi), ...
          1/2*sqrt(3/pi)*cos(theta), tol);

% Y_1^1(\theta, \phi) = 1/2*sqrt(3/2/pi)*sin(\theta)*e^(i\phi).
CheckNear(GetSphericalHarmonicFcn(1, 1, lTheta, lPhi), ...
          -1/2*sqrt(3/2/pi)*sin(theta).*exp(1i*phi), tol);

% Y_2^{-2}(\theta, \phi) = 1/4*sqrt(15/2/pi)*sin^2(\theta)*exp(-2i\phi).
CheckNear(GetSphericalHarmonicFcn(2, -2, lTheta, lPhi), ...
          1/4*sqrt(15/2/pi)*sin(theta).^2.*exp(-2*1i*phi), tol);

% Y_2^{-1}(\theta, \phi) = 1/2*sqrt(15/2/pi)*sin(\theta)*cos(\theta)*exp(-i\phi).
CheckNear(GetSphericalHarmonicFcn(2, -1, lTheta, lPhi), ...
          1/2*sqrt(15/2/pi)*sin(theta).*cos(theta).*exp(-1i*phi), tol);

% Y_2^0(\theta, \phi) = 1/4*sqrt(5/pi)*(3cos^2(\theta)-1).
CheckNear(GetSphericalHarmonicFcn(2, 0, lTheta, lPhi), ...
          1/4*sqrt(5/pi)*(3*cos(theta).^2-1), tol);

% Y_2^1(\theta, \phi) = -1/2*sqrt(15/2/pi)*sin(\theta)*cos(\theta)*exp(i\phi).
CheckNear(GetSphericalHarmonicFcn(2, 1, lTheta, lPhi), ...
          -1/2*sqrt(15/2/pi)*sin(theta).*cos(theta).*exp(1i*phi), tol);

% Y_2^2(\theta, \phi) = 1/4*sqrt(15/2/pi)*sin^2(\theta)*exp(2i\phi).
CheckNear(GetSphericalHarmonicFcn(2, 2, lTheta, lPhi), ...
          1/4*sqrt(15/2/pi)*sin(theta).^2.*exp(2*1i*phi), tol);

fprintf('Passed.\n');
