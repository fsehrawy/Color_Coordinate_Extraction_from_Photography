clear
close all
clc

% First, we import the image of the reference background (e.g. black or
% grey) and the average color is used as the single reference color.
% Next, the difference between that reference color and each pixel in the
% reference image gives us the correction map to be applied to test photos.

ref_bg=imresize(imread('80 cm GREY.png'),[1434 2145]); % Import and resize to  728*1096
ref_bg_Lab=rgb2lab(ref_bg);
ref_avg_color_RGB=mean(mean(ref_bg)); % Average color in RGB coordinates, used to check
ref_avg_color_Lab=mean(mean(rgb2lab(ref_bg))); % Average color in Lab coordinates, used as illumination reference


test=imresize(imread('80 cm IT big.png'),[1434 2145]); % Import test image

% Correction map to be added to the test image to produce a corrected image.
correction_map=ref_avg_color_Lab(:,:,1)-ref_bg_Lab(:,:,1); % Use only the 'L' coordinate.
correction_map(:,:,2:3)=0; % 'a' and 'b' set to 0 to not make any 'a' or 'b' adjustments in the test photo.

correction_map=correction_map.*0.5; % correction scaling factor

% Corrected image is generated by added the 'L' corrections to the test
% image in Lab coordinates, then everything is converted back to RGB.
corrected_image=lab2rgb(rgb2lab(test)+correction_map);

% Plots

figure(1)
subplot(1,2,1)
imshow(ref_bg)
subplot(1,2,2)
imshow(correction_map)

figure(2)
imshow(test)

figure(3)
imshow(corrected_image)


