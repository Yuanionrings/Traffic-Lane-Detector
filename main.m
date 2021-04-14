% COMP3800 – Image Processing
% Traffic Lane Detector
% Yuan Gao, Wil Eddy, Tyler
% 03/31/2021

clc; close all; clear;

% Scan in Image
test = imread('resource\biggg.jpg');
test = imrotate(test,270);
rgb = double(test) / 255;

% Convert to Grayscale
G = rgb2gray(rgb);

% Yellow Masking
[Yellow, YellowMaskedRGBImage] = createMask(rgb, 1, 0.5, 0.2, 1, .65, 1);
%[Yellow, YellowMaskedRGBImage] = createMask(rgb, 1, 0.5, 0.2, 1, .85, 1);

% White Masking
[White, WhiteMaskedRGBImage] = createMask(rgb, 0, 1, 0, .08, .80, 1);
%[White, WhiteMaskedRGBImage] = createMask(rgb, 0, 1, 0, .08, .95, 1);

% Combined Mask
C = Yellow + White;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Slight Gaussian blur, this reduces number of detected edges
Combined_Image_Gaussian_Blur = imgaussfilt(C,2);

% Apply Canny Edge Detection
Edge_Detection_Image = edge(Combined_Image_Gaussian_Blur, 'canny', [.7 .99]);

% Perform ROI
% don't know how to handle this, should we make dynamic for pictures
% or just hard code for our images?
% these params are xmin yim width height
Cropped_Image = imcrop(Edge_Detection_Image,[0 1400 3024 1400]);

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
imshow(Cropped_Image);
title('Region of Interest')

pause;

% Perform Hough Transform
[H,T,R] = hough(Cropped_Image);
P = houghpeaks(H,2,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
lines = houghlines(Cropped_Image,T,R,P,'FillGap',1000,'MinLength',2);

figure, imshow(G), hold on
max_len = 0;

for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2)+1400,'LineWidth',4,'Color','Red');

   % Plot beginnings and ends of lines
   %plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   %plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

pause;

clc; close all; clear;