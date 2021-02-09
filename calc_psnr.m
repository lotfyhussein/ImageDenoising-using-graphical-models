function [psnr] = calc_psnr(T, N)
    % Calculate the PSNR between two images
    % Input = T, N are the two images
    
    T = double(T);
    [row, col] = size(T);
    err = (T - N) .^ 2;
    mse = sum(sum(err)) / (row * col);
    psnr = 20 * log10( 255 / sqrt(mse));
end