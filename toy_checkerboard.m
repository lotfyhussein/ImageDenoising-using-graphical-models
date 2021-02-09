function [T] = toy_checkerboard(n, m, Csize)
% Make checkerboard artificial image.
% Input: n, m are the size of the image (nxm)
%        Csize is the Csize x Csize stripe box

    white = 255*ones(Csize, Csize);
    black = zeros(Csize, Csize);
    line_1 = repmat([white,black], [1, ceil(m/(2*Csize))]);
    line_2 = repmat([black,white], [1, ceil(m/(2*Csize))]);
    pattern = cat(1,line_1,line_2);
    T = repmat(pattern, [ceil(n/2), 1]);
    T = T(1:n, 1:m);
    % imshow(T);
end



