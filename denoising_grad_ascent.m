function [T] = denoising_grad_ascent(N, sigma, eta, gaussian_bool)
    % Denoise using gradient ascent method
    % Input = N is the noisy image
    %         sigma is the standard deviation for the distribution
    %         eta is the step size
    %         gaussian bool is 1 to use gaussian distribution.
    %                          0 to use student distribution.
    T = N;
    lp = denoising_lp(T, N, sigma, gaussian_bool, 1);
    for i = 1:2000
        %using gaussian prior
        if gaussian_bool == 1
            T = T  + eta .* (denoising_grad_llh(T, N, sigma) + mrf_grad_log_gaussian_prior(T, sigma));
        %--------------------------------------------------------------------------------------------
        %using student prior
        else
            T = T  + eta .* (denoising_grad_llh(T, N, sigma) + mrf_grad_log_student_prior(T, sigma, 1));
        end
        lp = [lp; denoising_lp(T, N, sigma, gaussian_bool, 1)];
    end
   % plot(lp);
    
end

