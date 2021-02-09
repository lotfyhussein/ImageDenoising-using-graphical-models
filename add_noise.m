function [N] = add_noise(T, sigma)
    % Add Gaussian noise to image.
    % Input = T is the true image.
    %         Sigma is the percentage of the range
    %         i.e. 25 / 255 ~= 10%
    %         add_noise(T, 0.1)
    
    T = double(T);
    [row, col] = size(T);
    N = T + randn(row, col) * sigma * 255;
    N = max(min(N, 255), 0);
    % imshow(N, [])
end