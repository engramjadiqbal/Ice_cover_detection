clear; clc; close;
load('S2_data.mat');% load Sentinel-2 (S2) data
r = 15; % radius of circular filter
cf = fspecial('disk', r);
Avg_S2 = imfilter(Sentinel_2, cf); % Circular cell averaging
Avg_S2= Avg_S2/(max(max(Avg_S2))); % Normalize
binary_image = im2bw(Avg_S2, 0.5); % gray to binary
Edge_S2= edge(binary_image,'sobel'); % find edge
xx = 1; yy = 1;
XX = 2001; YY = 1129;
%% quantify edges
ind_j_S2 = [xx XX]; ind_i_S2 = [yy YY];
[i_S2,j_S2] = find(Edge_S2);
ind_S2 = (i_S2 < ind_i_S2(2)) .* (i_S2 > ind_i_S2(1)) .* ...
    (j_S2 > ind_j_S2(1)) .* (j_S2< ind_j_S2(2));
i_S2 = i_S2(find(ind_S2));
j_S2 = j_S2(find(ind_S2));
%% Final image with ice-line edges
imshow(20*log10(Avg_S2),[-60 0]);axis 'square';hold on;
scatter(j_S2,i_S2,'r.','LineWidth',1);
title('Ice Edge Detection S2','FontSize',18); 
xlabel('Range [Pixels]','FontSize',18)
ylabel('Azimuth [Pixels]','FontSize',18)
axis on;axis square; c = colorbar; colormap gray;
ylabel(c,'[dB]','FontSize',18);set(gca,'FontSize',18)