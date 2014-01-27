function [c, l, m] = DecomposeSphericalFcn(F, L, lTheta, lPhi, verbose)

% [c, l, m] = DecomposeSphericalFcn(F, L, lTheta, lPhi)
%
% Decompose the spherical function 'F' into spherical harmonics of 'L'
% degrees. The output 'c', 'l' and 'm' are vectors of same size, of size
% (L+1)^2, with 'c' spherical coefficients, 'l' and 'm' corresponding degrees
% and orders
%   l = [0,  1 1 1,  2  2 2 2 2, ......,  L,      L, ...,   L, L]
%   m = [0, -1 1 1, -2 -1 0 1 2, ......, -L, -(L-1), ..., L-1, L].
%
%   Author: Ying Xiong.
%   Created: Jul 21, 2013.

if (~exist('verbose', 'var') || isempty(verbose))
  verbose = 0;
end

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

% Do the decomposition.
c = zeros((L+1)^2, 1);
l = zeros((L+1)^2, 1);
m = zeros((L+1)^2, 1);

for il = 0:L
  if (verbose == 1)
    ShowProgress(il, L, 1, 'DecomposeSphericalFcn', 1);
  end
  l(il^2 + (1:2*il+1)) = il;
  m(il^2 + (1:2*il+1)) = -il:il;
  for im = -il:il
    if (verbose == 2)
      fprintf(repmat(sprintf('\b'), [1, 40]));
      fprintf('DecomposeSphericalFcn: l = %d, m = %d', il, im);
      if (im == L)   fprintf('\n');   end
    end
    Ylm = GetSphericalHarmonicFcn(il, im, lTheta, lPhi);
    c(il^2+im+il+1) = SphericalInnerProduct(F, Ylm);
  end
end
