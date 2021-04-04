# Traffic-Lane-Detector

## Introduction
This project takes in an image of a road scene. This image then
undergoes our lane detection pipeline which consists of 1) converts the 
original image to grayscale 2) darken the grayscale, 3) convert 
original image to HLS color space, 4) isolate yellow and white from
HLS to get colored masks, 5) bit-wise or yellow and white masks to
get common mask, 6) bit-wise and mask with darkened image, 7) apply
slight Gaussian blur 8) apply canny edge detection (adjusts the thresholds
-trial and error) to get edges 9) define region of interest, weeds out
unwanted edges detected by canny edge detector 10) retreieve hough lines,
11) consolidate and extrapolate houghlines and overlay them on original image

## Setup and Running
Simply clone this code into a local directory, open it in MATLAB,
store an image of a road scene into the resource folder, and run 
main.m to see your image with dividing line overlays!

## Contributors
Yuan Gao (gaoy@wit.edu)
Wil Eddy (eddyw@wit.edu)
Tyler Crepaeu (crepeaut@wit.edu)