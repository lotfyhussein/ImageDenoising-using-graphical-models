function [g] = mrf_grad_log_student_prior(T, sigma, alpha)
    % Gradient of the Student Prior
    % Input = T is the expected image
    %         sigma, alpha are required parameter for the distribution
    
   T = double(T); 
   % Pad array for values on the edges of the image
   Tpad = padarray(T, [1, 1], 'replicate');
   [row, col] = size(Tpad);
   g = Tpad;
   for i = 2:row-1
       for j = 2:col-1
           g1 = -alpha .* ((1 + (((Tpad(i,j)-Tpad(i+1,j)).^2)./(2*sigma^2))).^(-alpha-1)) .* (Tpad(i,j)-Tpad(i+1,j))./(sigma^2)./((1 + (((Tpad(i,j)-Tpad(i+1,j)).^2)./(2*sigma^2))).^(-alpha));
           g2 = alpha .*  ((1 + (((Tpad(i-1,j)-Tpad(i,j)).^2)./(2*sigma^2))).^(-alpha-1)).* (Tpad(i-1,j)-Tpad(i,j))./(sigma^2)./((1 + (((Tpad(i-1,j)-Tpad(i,j)).^2)./(2*sigma^2))).^(-alpha));
           g3 = -alpha .* ((1 + (((Tpad(i,j)-Tpad(i,j+1)).^2)./(2*sigma^2))).^(-alpha-1)) .* (Tpad(i,j)-Tpad(i,j+1))./(sigma^2)./((1 + (((Tpad(i,j)-Tpad(i,j+1)).^2)./(2*sigma^2))).^(-alpha));
           g4 = alpha .*  ((1 + (((Tpad(i,j-1)-Tpad(i,j)).^2)./(2*sigma^2))).^(-alpha-1)) .* (Tpad(i,j-1)-Tpad(i,j))./(sigma^2)./((1 + (((Tpad(i,j-1)-Tpad(i,j)).^2)./(2*sigma^2))).^(-alpha));
           g(i,j) = g1 + g2 + g3 + g4;
       end
   end

   g = g(2:row-1, 2:col-1);
end

