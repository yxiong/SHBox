% A demonstration script for using this toolbox.
%
%   Author: Ying Xiong.
%   Created: Jul 21, 2013.

%% Demonstrate the spherical harmonics decomposition.
% Load a light probe image.
F = rgb2gray(im2double(imread('pisa.png')));
% List of spherical harmonic orders.
lList = [0 1 2 3 5 11 21 31];
% Perform decomposition on highest order.
[c, l, m] = DecomposeSphericalFcn(F, max(lList), [], [], 1);
% Plot the results, ground truth first.
[nRows, nCols] = NumSubplotRowsColsFromTotal(length(lList)+1);
figure;
subplot(nRows, nCols, 1);
imshow(F, []);
title('Ground truth');
drawnow;
% Plot the approximation at each order.
for i = 1:length(lList)
  il = lList(i);
  subplot(nRows, nCols, i+1);
  % Combine the spherical harmonic functions.
  Fc = CombineSphericalHarmonicFcns(c(1:(il+1)^2), l(1:(il+1)^2), m(1:(il+1)^2), ...
                                    size(F,1), size(F,2));
  imshow(real(Fc), [min(F(:)), max(F(:))]);
  title(['L = ', num2str(il)]);
  drawnow;
end

%% Visualize a spherical harmonic function.
l = 5;
m = -2;
nTheta = 41;
nPhi = 41;
Ylm = GetSphericalHarmonicFcn(l, m, nTheta, nPhi);
figure;
VisualizeSphericalFcn(Ylm);
