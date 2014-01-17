function Ylm = GetSphericalHarmonicFcn(l, m, lTheta, lPhi)

% Ylm = GetSphericalHarmonicFcn(l, m, lTheta, lPhi)
%
% Create a spherical harmonic function of degree 'l' and order 'm' (both are
% scalars). 'lTheta' and 'lPhi' can either be scalars or vectors specifying
% number of coordinate samples or coordinate themselves. See README.txt for more
% details.
%
%   Author: Ying Xiong.
%   Created: Jul 21, 2013.

% Get coordinates.
if (isscalar(lTheta))
  lTheta = linspace(0, pi, lTheta);
end
if (isscalar(lPhi))
  lPhi = linspace(-pi, pi, lPhi);
end
nTheta = length(lTheta);
nPhi = length(lPhi);

% Calculate (-1)^m.
if (mod(m, 2)==1)
  neg1_m = -1;
else
  neg1_m = 1;
end

% Get fully normalized associated Legendre polynomial.
Nl = legendre(l, cos(lTheta), 'norm');
if (m >= 0)
  Nlm = Nl(m+1, :)';
else
  Nlm = neg1_m * Nl(-m+1, :)';
end

% Get the spherical harmonic function.
Ylm = neg1_m * sqrt(1/2/pi) * repmat(Nlm, [1 nPhi]) .* ...
      repmat(exp(1i*m*lPhi), [nTheta 1]);
