
%% Lab 6: Mini Project - Image Processing Pipeline
% Noise Removal, Contrast Enhancement, Edge Detection
% and Frequency-Domain Filtering

close all;
clear;
clc;

%% 1. Load and prepare image

filename = 'your_image.jpg';

if exist(filename,'file')
    I0 = imread(filename);
elseif exist('peppers.png','file')
    I0 = imread('peppers.png');
else
    I0 = imread('cameraman.tif');
end

if size(I0,3) == 3
    I = im2double(rgb2gray(I0));
else
    I = im2double(I0);
end

fprintf('Image loaded successfully.\n');
fprintf('Image size: %d x %d pixels\n',size(I,1),size(I,2));

%% 2. Noise removal using median filter

I_filt = medfilt2(I,[3 3]);

%% 3. Contrast enhancement

I_enh = imadjust(I_filt,[0.2 0.8],[0 1]);

%% 4. Edge detection using Canny

edges = edge(I_enh,'Canny',[0.1 0.25]);

%% 5. Frequency-domain low-pass filtering

F = fftshift(fft2(I_enh));

[M,N] = size(F);

[u,v] = meshgrid(-floor(N/2):ceil(N/2)-1, ...
                 -floor(M/2):ceil(M/2)-1);

D = sqrt(u.^2 + v.^2);

cutoff = 60;

H = double(D < cutoff);

I_lp = real(ifft2(ifftshift(F .* H)));

%% 6. Display complete processing pipeline

figure(1);

montage({I,I_filt,I_enh,edges,I_lp},'Size',[1 5]);

title('Original | Denoised | Enhanced | Edges | Low-pass Result');

saveas(gcf,'Lab06_pipeline.png');

%% 7. Display frequency spectrum

figure(2);

F_display = log(1 + abs(F));

imshow(F_display,[]);

title('Frequency Spectrum of Enhanced Image');

colorbar;

saveas(gcf,'Lab06_frequency_spectrum.png');

%% 8. Save individual processing results

figure(3);

montage({I,I_filt,I_enh},'Size',[1 3]);

title('Original | Median Filter | Contrast Enhancement');

saveas(gcf,'Lab06_enhancement.png');

figure(4);

imshow(edges);

title('Canny Edge Detection');

saveas(gcf,'Lab06_edges.png');

%% 9. Final information

fprintf('\nLAB 6 RESULTS\n');
fprintf('Image processing pipeline completed.\n');
fprintf('Median filtering: 3x3\n');
fprintf('Contrast enhancement: imadjust\n');
fprintf('Edge detection: Canny\n');
fprintf('Frequency-domain filter: Ideal low-pass\n');
fprintf('Low-pass cutoff: %d\n',cutoff);
fprintf('All four figures saved successfully.\n');
