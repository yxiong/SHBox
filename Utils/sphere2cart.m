function varargout = sphere2cart(varargin)

% USAGE:
%   cartisian_coord = sphere2cart(sphere_coord)
%   cartisian_coord = sphere2cart(rho,theta,phi)
%   [x,y,z]         = sphere2cart(cartisian_coord)
%   [x,y,z]         = sphere2cart(rho,theta,phi)
%
% DESCRIPTION:
%   Compute the cartisian coordinates from sphere ones
%     x = rho * cos(phi) * sin(theta)
%     y = rho * sin(phi) * sin(theta)
%     z = rho * cos(theta)
%   Correspondingly,
%     rho = sqrt(x^2+y^2+z^2)
%     theta = arccos(z/rho)
%     phi = arctan(y/x)
%
% INPUT:
%   sphere_coord:     a 3XN matrix of sphere coordinates
%   rho,theta,phi:    1XN vector for cooresponding coordinates
%
% OUTPUT:
%   cartisian_coord:  a 3XN matrix of cartisian coordinates
%   x,y,z:            1XN vector for cooresponding coordinates
%
%   Author: Ying Xiong
%   Created: Feb 04, 2012

if (nargin == 1)
  rho = varargin{1}(1,:)';
  theta = varargin{1}(2,:)';
  phi = varargin{1}(3,:)';
elseif (nargin == 3)
  rho = varargin{1};
  theta = varargin{2};
  phi = varargin{3};
else
  error('wrong input');
end

x = rho .* cos(phi) .* sin(theta);
y = rho .* sin(phi) .* sin(theta);
z = rho .* cos(theta);

if (nargout == 1)
  varargout{1} = [x; y; z];
elseif (nargout == 3)
  varargout{1} = x;
  varargout{2} = y;
  varargout{3} = z;
else
  error('wrong output');
end
