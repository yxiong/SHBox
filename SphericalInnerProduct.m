function r = SphericalInnerProduct(F, G, lTheta, lPhi)

% r = SphericalInnerProduct(F, G, lTheta, lPhi)
%
% Compute the spherical inner product of two functions 'F' and 'G'. See
% README.txt for more details.
%
%   Author: Ying Xiong.
%   Created: Jul 21, 2013.

% Get coordinates.
if (~exist('lTheta', 'var') || isempty(lTheta))
  lTheta = linspace(0, pi, size(F,1));
elseif (isscalar(lTheta))
  lTheta = linspace(0, pi, lTheta);
end
if (~exist('lPhi', 'var') || isempty(lPhi))
  lPhi = linspace(-pi, pi, size(F,2));
elseif (isscalar(lPhi))
  lPhi = linspace(-pi, pi, lPhi);
end
nPhi = length(lPhi);

% Do the integration.
r = trapz(lPhi, trapz(lTheta, F.*conj(G).*repmat(sin(lTheta(:)), [1 nPhi])));
