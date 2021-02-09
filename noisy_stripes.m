
function [stripes, NS] = noisy_stripes(img)

rows = 121;
columns = 221;

rowVector = (1 : rows)';
cosVector = (1 + cos(2 * pi * rowVector / 20))/2 + 0.5;
stripes = repmat(cosVector, [1, columns]);
NS = stripes .* double(img);

end