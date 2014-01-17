function F = CombineSphericalHarmonicFcns(c, l, m, lTheta, lPhi)

% F = CombineSphericalHarmonicFcns(c, l, m, lTheta, lPhi)
%
% Combine a list of spherical harmonic functions
%   F = \sum_i c(i) Y_{l(i)}^{m(i)}.
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

% Do the combination.
F = zeros(nTheta, nPhi);
for i = 1:length(c)
  F = F + c(i) * GetSphericalHarmonicFcn(l(i), m(i), lTheta, lPhi);
end
