rng(7);

%% Problem 2

TC = toy_checkerboard(50, 50, 5);
TS = toy_stripes(50, 50, 5);
N_TC = add_sp_noise(TC, 0.1);     N_TS = add_sp_noise(TS, 0.1);
MF_TC = median_filter(N_TC, 3);   MF_TS = median_filter(N_TS, 3);
% figure(1); imshow(MF_TC, []); figure(2); imshow(MF_TS, []);

img = imread('la.png');
N = add_noise(img, 0.1);
MF = median_filter(N, 3);
% imshow(MF, []);

%% Problem 3 - b

GA_GAUSS = denoising_grad_ascent(N, 22, 0.1, true);
disp('----- Problem 3 - b -----')
disp('PSNR(IMG, MF) = ')
disp(calc_psnr(img, MF))
disp('PSNR(IMG, GA_GAUSS) = ')
disp(calc_psnr(img, GA_GAUSS))
% imshow(GA_GAUSS, []);

%% Problem 3 - c

GA_GAUSS_2 = denoising_grad_ascent(MF, 20, 0.01, true);
disp('----- Problem 3 - c -----')
disp('PSNR(IMG, GA_GAUSS_2) = ')
disp(calc_psnr(img, GA_GAUSS_2))
% imshow(GA_GAUSS_2, []);

%% Problem 4 - a

GA_STD = denoising_grad_ascent(N, 22, 0.5, false);
disp('----- Problem 4 - a -----')
disp('PSNR(IMG, GA_STD) = ')
disp(calc_psnr(img, GA_STD))
% imshow(GA_STD, []);

%% Problem 4 - b

G_la = mrf_grad_log_student_prior(img, 22, 1);
G_TC = mrf_grad_log_student_prior(TC, 22, 1);
G_TS = mrf_grad_log_student_prior(TS, 22, 1);
% imshow(G, []);
% imshow(G_TC, []);
% imshow(G_TS, []);

%% Problem 5

[S, NS] = noisy_stripes(img);
% figure(1); imshow(S, []); figure(2); imshow(NS, []);
GA_GAUSS_NS = denoising_grad_ascent(NS, 22, 0.1, true);
G_NS = mrf_grad_log_gaussian_prior(NS, 22);
% figure(1); imshow(GA_GAUSS, []); figure(2); imshow(G, []);
GA_STD_NS = denoising_grad_ascent(NS, 22, 0.1, false);
G_NS = mrf_grad_log_student_prior(NS, 22, 1);
% figure(1); imshow(GA_STD, []); figure(2); imshow(G, []);
disp('----- Problem 5 -----')
disp('PSNR(IMG, GA_GAUSS_NS) = ')
disp(calc_psnr(img, GA_GAUSS_NS))
disp('PSNR(IMG, GA_STD_NS) = ')
disp(calc_psnr(img, GA_STD_NS))
