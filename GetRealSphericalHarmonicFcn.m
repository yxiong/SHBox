function Ylm = GetRealSphericalHarmonicFcn(l, m, lTheta, lPhi)

% Ylm = GetRealSphericalHarmonicFcn(l, m, lTheta, lPhi)
%
% Create a real spherical harmonic function of degree 'l' and order 'm'. See
% README.txt for more details.
%
%   Author: Ying Xiong.
%   Created: Jan 16, 2014.

if (mod(m, 2) == 1)
  neg1_m = -1;
else
  neg1_m = 1;
end

% TODO: We currently calculate Y_{lm} by definition, but it could be faster.
if (m > 0)
  Ylm = 1/sqrt(2)*(GetSphericalHarmonicFcn(l, -m, lTheta, lPhi) + ...
                   GetSphericalHarmonicFcn(l,  m, lTheta, lPhi) * neg1_m);
elseif (m == 0)
  Ylm = GetSphericalHarmonicFcn(l, 0, lTheta, lPhi);
else
  Ylm = 1i/sqrt(2)*(GetSphericalHarmonicFcn(l,  m, lTheta, lPhi) - ...
                    GetSphericalHarmonicFcn(l, -m, lTheta, lPhi) * neg1_m);
end
Ylm = real(Ylm);
