function VisualizeSphericalFcn(F, lTheta, lPhi, dataType)

% VisualizeSphericalFcn(F, lTheta, lPhi)
%
% Visualize a spherical function f(\theta, \phi), in the spherical coordinate
% parametric equation
%   \rho(\theta, \phi) = Df(\theta, \phi),
% where 'Df' is the "data version" of function 'f' specified by 'dataType',
% with options ['real', 'imag', 'abs', {'all'}].
%
% See README.txt for more details on spherical function representation.
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
[phi, theta] = meshgrid(lPhi, lTheta);

% Set 'dataType'.
if (~exist('dataType', 'var') || isempty(dataType))
  dataType = 'all';
end

% Do the visualization.
if (strcmp(dataType, 'real'))
  VisualizeSphericalFcn_Helper(theta, phi, real(F));
end

if (strcmp(dataType, 'imag'))
  VisualizeSphericalFcn_Helper(theta, phi, imag(F));
end

if (strcmp(dataType, 'abs'))
  VisualizeSphericalFcn_Helper(theta, phi, abs(F));
end

if (strcmp(dataType, 'all'))
  subplot(131);
  VisualizeSphericalFcn_Helper(theta, phi, abs(F));
  title('|F|');
  subplot(132);
  VisualizeSphericalFcn_Helper(theta, phi, real(F));
  title('Real(F)');
  subplot(133);
  VisualizeSphericalFcn_Helper(theta, phi, imag(F));
  title('Imag(F)');
end

end

function VisualizeSphericalFcn_Helper(theta, phi, Df)
  
[x, y, z] = sphere2cart(Df, theta, phi);
surf(x, y, z);
light;
lighting phong;
axis tight equal off;
view(40, 30);
camzoom(1.5);

end
