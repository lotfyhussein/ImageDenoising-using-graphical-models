function [T] = median_filter(N, wSize)
    % Median Filter method to denoise image
    % Input = N is the noisy image
    %         wSize is the window size
    
    [row col] = size(N);
    Npad = padarray(N, [wSize-2, wSize-2], 'replicate');
    T = zeros(row, col);
    for x = 1 : row
        for y = 1 : col
            for i = 1 : wSize
                for j = 1 : wSize
                    q = x - 1;     
                    w = y - 1;
                    window((i - 1) * wSize + j) = Npad(i + q, j + w);
                end
            end
            T(x, y) = median(window(:));
        end
    end
end