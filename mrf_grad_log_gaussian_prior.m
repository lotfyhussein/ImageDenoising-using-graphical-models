function [g] = mrf_grad_log_gaussian_prior(T,sigma)
    % Gradient of the log prior
    % Input = T is the predicted image
    %         sigma is the standard deviation for the distribution
    
   T = double(T);
   % Pad array for values on the edges of the image
   Tpad = padarray(T, [1, 1], 'replicate');
   [row, col] = size(Tpad);
   g = 1/sigma^2;
   
   g1 = g * -(Tpad(2:row-1, 2:col-1) - Tpad(3:row,2:col-1)); % Down
   g2 = g * -(Tpad(2:row-1, 2:col-1) - Tpad(2:row-1,3:col)); % Right
   
   g3 = g * (Tpad(1:row-2, 2:col-1) - Tpad(2:row-1, 2:col-1)); % Up
   g4 = g * (Tpad(2:row-1, 1:col-2) - Tpad(2:row-1, 2:col-1)); % Left
   
   g = (g1 + g2 + g3 + g4);

end

