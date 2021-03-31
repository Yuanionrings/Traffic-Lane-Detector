% COMP3800 – Image Processing
% Traffic Lane Detector
% Yuan Gao, Will Eddy, Tyler
% 03/31/2021

clc; close all; clear;

% Scan in Image
test = imread('resource\test.jpg');
rgb = double(test) / 255;

% Convert to Grayscale
G = rgb2gray(rgb);

% Darken Grayscale
D = imadjust(G);

% RGB to HSV
HSV = rgb2hsv(rgb);

% RGB to HSL
HSL = rgb2hsl(rgb);

% Show Original Image
subplot(2, 3, 1);
imshow(rgb);
title('original');

subplot(2, 3, 2);
imshow(G);
title('grayscale');

subplot(2, 3, 3);
imshow(D);
title('darkened grayscale');

subplot(2, 3, 4);
imshow(HSV);
title('HSV');

subplot(2, 3, 5);
imshow(HSL);
title('HSL');

pause;


clc; close all; clear;