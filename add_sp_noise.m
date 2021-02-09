function [N] = add_sp_noise(T,p)
    % Add Gaussian noise to image.
    % Input = T is the true image.
    %         p is the percentage of the expected noise
    %         i.e. add_sp_noise(T, 0.1)
    
    N = T;
    r = rand(size(T));
    pepper = find(r < p/2);
    N(pepper) = 0;
    salt = find(r >= p/2 & r < p);
    N(salt) = 255;
end

