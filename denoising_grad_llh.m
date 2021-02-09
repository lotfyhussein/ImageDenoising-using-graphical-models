function [g] = denoising_grad_llh(T, N, sigma)
    % Gradient of the log likelihood
    % Input = T is the predicted image
    %         N is the noisy image
    %         sigma is standard deviation for the distribution
    
    T = double(T);
    g = (1/(sigma^2) .* (N-T));
end

