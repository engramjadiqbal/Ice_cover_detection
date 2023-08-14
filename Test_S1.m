clear; clc; close;
load('S1_data.mat');% load Sentinel-2 (S2) data
N =15; % set the window size of the filter, we can tune this parameter
win = 1/(N*N)*ones(N); % this implements the sliding window
%% rho matrix 
rho_matrix= filter2(win,((Img_HH).*(Img_HV)));
rho_matrix = rho_matrix/max(rho_matrix(:));
rho_matrix(rho_matrix == 0) = NaN;
rho_matrix(isnan(rho_matrix))= NaN;
%% binary
ice_data = rho_matrix(300:500, 400:600); % select ice patch
dist = fitdist(ice_data(:), 'Burr');
threshold = icdf(dist, 0.95);
Img_logic_S1 = rho_matrix < threshold;
%% quantify edges
Edge_S1= edge(Img_logic_S1,'canny');
ind_j = [1 2001]; ind_i = [1 1129];
[i_S1,j_S1] = find(Edge_S1);
ind_small = (i_S1 < ind_i(2)) .* (i_S1 > ind_i(1)) .* ...
    (j_S1 > ind_j(1)) .* (j_S1< ind_j(2));
i_S1 = i_S1(find(ind_small));
j_S1 = j_S1(find(ind_small));
%% Final image with ice-line edges
imshow(10*log10(rho_matrix),[-60 0]),axis 'square',hold on
scatter(j_S1,i_S1,'m.','LineWidth',4);
title('Ice Edge Detection S2','FontSize',18); 
xlabel('Range [Pixels]','FontSize',18)
ylabel('Azimuth [Pixels]','FontSize',18)
axis on;axis square; c = colorbar; colormap gray;
ylabel(c,'[dB]','FontSize',18);set(gca,'FontSize',18);