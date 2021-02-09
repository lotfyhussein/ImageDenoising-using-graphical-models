function [lp] = denoising_lp(T, N, sigma, gaussian_bool, alpha)
    % Denoising log posterior
    % Input = T is the predicted image
    %         N is the noisy image
    %         sigma is standard deviation for the distribution
    %         gaussian_bool is 1 if Gaussian distribution is used
    %                       is 0 if Student distribution is used
    %         alpha is only used for Student distribution 
    
    T = double(T);
    % Likelihood
    l_lh = (-1/(2*sigma^2) .* (N-T).^2);
    % Pad array for values on the edges of the image
    Tpad = padarray(T, [1, 1], 'replicate');
    [row, col] = size(Tpad);
    
    % Prior
    if gaussian_bool == 1
        % for Gaussian Distribution
        s = -1/(2*sigma^2);

        n1 = s * (Tpad(2:row-1, 2:col-1) - Tpad(3:row  , 2:col-1)).^2; % Down
        n2 = s * (Tpad(2:row-1, 2:col-1) - Tpad(2:row-1, 3:col  )).^2; % Right

        n3 = s * (Tpad(1:row-2, 2:col-1) - Tpad(2:row-1, 2:col-1)).^2; % Up
        n4 = s * (Tpad(2:row-1, 1:col-2) - Tpad(2:row-1, 2:col-1)).^2; % Left

        s = n1 + n2 + n3 + n4;
        
        % Log Posterior
        lp = sum(s, 'all') + sum(l_lh, 'all');
    else
        % for Student Distribution
        s = 1/(2*sigma^2);
        
        n1 = (1 + s * (Tpad(2:row-1, 2:col-1) - Tpad(3:row  , 2:col-1)).^2).^(-alpha); % Down
        n2 = (1 + s * (Tpad(2:row-1, 2:col-1) - Tpad(2:row-1, 3:col  )).^2).^(-alpha); % Right

        n3 = (1 + s * (Tpad(1:row-2, 2:col-1) - Tpad(2:row-1, 2:col-1)).^2).^(-alpha); % Up
        n4 = (1 + s * (Tpad(2:row-1, 1:col-2) - Tpad(2:row-1, 2:col-1)).^2).^(-alpha); % Left
        
        s = log(n1) + log(n2) + log(n3) + log(n4);
        
        % Log Posterior
        lp = sum(s, 'all') + sum(l_lh, 'all');
    end
    
end

