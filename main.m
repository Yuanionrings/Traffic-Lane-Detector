% COMP3800 – Image Processing
% Traffic Lane Detector
% Yuan Gao, Wil Eddy, Tyler
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

% Yellow Masking
[Yellow, YellowMaskedRGBImage] = createMask(rgb, 1, 0.5, 0.2, 1, .85, 1);

% White Masking
[White, WhiteMaskedRGBImage] = createMask(rgb, 0, 1, 0, .08, .95, 1);

% Combined Mask
C = Yellow + White;

% Show original Image
subplot(2, 3, 1);
imshow(rgb);
title('original');

% Show grayscale Image
subplot(2, 3, 2);
imshow(G);
title('grayscale');

% Show darkened grayscale Image
subplot(2, 3, 3);
imshow(D);
title('darkened grayscale');

% Show HSV Image
subplot(2, 3, 4);
imshow(HSV);
title('HSV');

% Show HSL Image
subplot(2, 3, 5);
imshow(HSL);
title('HSL');
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Show original Image
subplot(2, 2, 1);
imshow(rgb);
title('original');

% Show yellow mask Image
subplot(2, 2, 2);
imshow(Yellow);
title('yellow lines');

% Show white mask Image
subplot(2, 2, 3);
imshow(WhiteMaskedRGBImage);
title('white lines');

% Show Combined Image
subplot(2, 2, 4);
imshow(C);
title('Combined');

pause;

% Slight Gaussian blur, this reduces number of detected edges
Combined_Image_Gaussian_Blur = imgaussfilt(C,2);

% Apply Canny Edge Detection
Edge_Detection_Image = edge(Combined_Image_Gaussian_Blur, 'canny');

% Show Combined Image
subplot(2, 2, 1);
imshow(C);
title('Combined');

% Show Gaussian Blurred Image
subplot(2, 2, 2);
imshow(Combined_Image_Gaussian_Blur);
title('Combined_Image_Gaussian_Blurred'); 

% Show Canny Edge Detection Image
subplot(2, 2, 3);
imshow(Edge_Detection_Image); 
title('Edge_Detection_Image'); 

% Show Region of Interest
subplot(2, 2, 4);
imshow(ROI);
title('Region of Interest')

pause;





clc; close all; clear;