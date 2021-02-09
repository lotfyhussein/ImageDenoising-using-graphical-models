function [T] = toy_stripes(n, m, sSize)
% Make stripe artificial image.
% Input: n, m are the size of the image (nxm)
%        sSize is the stripe width

    white = 255*ones(1, sSize);
    black = zeros(1, sSize);
    stripe = [white,black];
    pattern = repmat(stripe, [1, ceil(m/(2*sSize))]);
    T = repmat(pattern, [n, 1]);
    T = T(1:n, 1:m);
% imshow(T);
end

