function [nrows, ncols] = subplotRowsColsGivenAllNum(nAll)

% [nrows, ncols] = subplotRowsColsGivenAllNum(nAll)
%
% Find the best number of rows and columns for a subplot, given all numbers
% of plots. The result will be such that
%     {(nrows-1)*ncols, (ncols-1)*nrows} < nAll <= nrows*ncols
%                                           (enough subplots, but not too many)
%     nrows <= ncols <= nrows+1             (slightly fat figure)
%
%   Author: Ying Xiong
%   Created: Oct 27, 2012

ncols = ceil(sqrt(nAll));
nrows = ceil(nAll / ncols);
