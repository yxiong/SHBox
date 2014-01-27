================================================================
SHBox --- A matlab toolbox for spherical harmonics.
================================================================

Author: Ying Xiong.
Created: Jul 21, 2013.
Release: Jan 17, 2014 (v0.1).

================================================================
Quick start.
================================================================
>> addpath('Utils');
>> SHBoxTest;
>> demoSHBox;

================================================================
Definitions.
================================================================

The inner product in spherical space is defined as
           / \pi        / \pi
  <f, g> = |            |            f(\theta,\phi) g*(\theta,\phi) d\Omega,
           / \theta=0   / \phi=-pi
where
  d\Omega = sin(\theta) d\phi d\theta.

The spherical harmonic functions are defined as
                             (2l+1) (l-m)!
  Y_l^m(\theta,\phi) = sqrt{---------------} P_l^m(cos(\theta)) exp(im\phi)
                              4 pi  (l+m)!
                     = (-1)^m sqrt{1/(2 pi)} N_l^m(cos(\theta)) exp(im\phi),
where P_l^m is associated Legendre function, and N_l^m is fully normalized
associated Legendre function. Therefore, we have
  < Y_{l1}^{m1}, Y_{l2}^{m2} > = \delta_{l1,l2} \delta_{m1,m2}.

The real spherical harmonic functions are defined as
             / 1/sqrt(2) (Y_l^{-m} + (-1)^m Y_l^m)   if m>0
  Y_{l,m} = |  Y_l^0                                 if m=0
             \ 1/sqrt(2) (Y_l^m - (-1)^m Y_l^{-m})   if m<0.

================================================================
Representations.
================================================================
A spherical function f(\theta, \phi) is represented by a matrix 'F' with two
(optional) coordinate lists 'lTheta' and 'lPhi', such that
  F(i,j) = f(lTheta(i), lPhi(j)).
If not specified, 'lTheta' and 'lPhi' are by default
  lTheta = linspace(0, pi, size(F,1)),
  lPhi = linspace(-pi, pi, size(F,2)).
If 'lTheta' and 'lPhi' are scalars, they will be converted to
  lTheta = linspace(0, pi, lTheta),
  lPhi = linspace(-pi, pi, lPhi).

================================================================
Features.
================================================================
* Generate real and complex spherical harmonic functions.
* Visualize spherical functions.
* Inner product in spherical space.
* Decompose spherical function into spherical harmonic components.

See 'SphericalHarmonics.pdf' for a more detailed documentation.

================================================================
Other notes.
================================================================
The 'pisa.png' file is a light probe image downloaded from http://gl.ict.usc.edu/Data/HighResProbes/ and modified (tone-mapped and resized) by Ying Xiong.
