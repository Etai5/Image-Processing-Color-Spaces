%% Image Processing Homework 2:
% Etai Wigman - 315875385      Itzik Nsimov - 206697849
disp("Etai Wigman 315875385     Itzik Nsimov 206697849")
%% 1) RGB and Grayscale
clear variables
close all
clc
%% 1.1) Reading the Image
close all
clc
picasso = imread("picasso.jpg");
% picasso_rgb = rescale(double(picasso));
picasso_d = double(picasso);
picasso_rgb = (picasso_d-min(picasso_d(:)))/(max(picasso_d(:))-min(picasso_d(:)));
% convert to double and rescale the image to [0,1]

clear picasso_d

%% 1.2) Displaying the image
close all
clc
imshow(picasso_rgb); title("Picasso in RGB",FontSize=16);
%% 1.3) RGB Display
close all
clc
picasso_r = picasso_rgb(:,:,1);     % first dimention is red
picasso_g = picasso_rgb(:,:,2);     % second dimention is green
picasso_b = picasso_rgb(:,:,3);     % third dimention is blue
subplot(1,3,1); imshow(picasso_r); title("Red Channel",FontSize=16); colorbar;
subplot(1,3,2); imshow(picasso_g); title("Green Channel",FontSize=16); colorbar;
subplot(1,3,3); imshow(picasso_b); title("Blue Channel",FontSize=16); colorbar;

clear picasso_r picasso_g picasso_b

%% 1.5) Compare function to matlab gray
close all
clc
picasso_gray = dip_rgb2gray(picasso_rgb);
picasso_gray_matlab = rgb2gray(picasso_rgb);
subplot(1,2,1); imshow(picasso_gray); title("Exercise Picasso",FontSize=16);
subplot(1,2,2); imshow(picasso_gray_matlab); title("Matlab Picasso",FontSize=16);
difference = sum(abs(picasso_gray-picasso_gray_matlab),"all");
fprintf("The absolute difference between the images is:%g\n",difference);

%% 2) Additive vs Subtractive Color space
clear picasso_gray picasso_gray_matlab difference
close all
clc

%% 2.2) Creating CYMK channels from RGB channels
close all
clc
[cyan, yellow, magenta, black] = dip_rgb2cymk(picasso_rgb);
% create CYMK Channels from rgb image;
imshow(cyan); title("Cyan Channel",FontSize=16);
imshow(yellow); title("Yellow Channel",FontSize=16);
imshow(magenta); title("Magenta Channel",FontSize=16);
imshow(black); title("Black Channel",FontSize=16);

%% 2.3) Display the separate channels
close all
clc
displayCYMK(cyan,yellow,magenta,black);

%% 3) HSV
clear cyan yellow magenta black
close all
clc

%% 3.3) Convert and Display the image
close all
clc
picasso_hsv = dip_rgb2hsv(picasso_rgb);
hue = picasso_hsv(:,:,1);
saturation = picasso_hsv(:,:,2);
value = picasso_hsv(:,:,3);
subplot(1,3,1); imshow(hue); title("Hue",FontSize=16); colorbar; colormap('hsv'); 
subplot(1,3,2); imshow(saturation); title("Saturation",FontSize=16); colorbar;
subplot(1,3,3); imshow(value); title("Value",FontSize=16); colorbar;

%% 3.5) Compare result to matlab built in function
close all
clc
picasso_hsv_matlab = rgb2hsv(picasso_rgb);
hue_matlab = picasso_hsv_matlab(:,:,1);
saturation_matlab = picasso_hsv_matlab(:,:,2);
value_matlab = picasso_hsv_matlab(:,:,3);
difference_h = sum(abs(hue - hue_matlab),"all");
difference_s = sum(abs(saturation - saturation_matlab),"all");
difference_v = sum(abs(value - value_matlab),"all");
fprintf("The absolute difference between the images Hue is:%g\n",difference_h);
fprintf("The absolute difference between the images Saturation is:%g\n",difference_s);
fprintf("The absolute difference between the images Value is:%g\n",difference_v);
subplot(2,3,1); imshow(hue);
title("Hue",FontSize=16); colorbar;
subplot(2,3,4); imshow(hue_matlab); colormap('hsv');
title("Matlab Hue",FontSize=16); colorbar;
subplot(2,3,2); imshow(saturation);
title("Saturation",FontSize=16); colorbar;
subplot(2,3,3); imshow(value);
title("Value",FontSize=16); colorbar;
subplot(2,3,5); imshow(saturation_matlab);
title("Matlab Saturation",FontSize=16); colorbar;
subplot(2,3,6); imshow(value_matlab);
title("Matlab Value",FontSize=16); colorbar;

clear picasso_hsv_matlab hue_matlab saturation_matlab value_matlab

%% 3.6) Switch order
close all
clc
% Picasso GRB is Picasso with Red and Green channels switched
picasso_grb(:,:,1) = picasso_rgb(:,:,2);
picasso_grb(:,:,2) = picasso_rgb(:,:,1);
picasso_grb(:,:,3) = picasso_rgb(:,:,3);
picasso_hsv_grb = dip_rgb2hsv(picasso_grb);
hue_grb = picasso_hsv_grb(:,:,1);
saturation_grb = picasso_hsv_grb(:,:,2);
value_grb = picasso_hsv_grb(:,:,3);
% subplot(1,2,1); imshow(picasso_grb);
% subplot(1,2,2); imshow(picasso_rgb);
% subplot(1,3,1); imshow(hue_grb); title("GRB Hue",FontSize=16); colorbar;
% subplot(1,3,2); imshow(saturation_grb); title("GRB Saturation",FontSize=16); colorbar;
% subplot(1,3,3); imshow(value_grb); title("GRB Value",FontSize=16); colorbar;
subplot(2,3,1); imshow(hue);
title("RGB Hue",FontSize=16); colorbar;
subplot(2,3,4); imshow(hue_grb);
title("GRB Hue",FontSize=16); colorbar;
colormap('hsv');
subplot(2,3,2); imshow(saturation);
title("RGB Saturation",FontSize=16); colorbar;
subplot(2,3,3); imshow(value);
title("RGB Value",FontSize=16); colorbar;
subplot(2,3,5); imshow(saturation_grb);
title("GRB Saturation",FontSize=16); colorbar;
subplot(2,3,6); imshow(value_grb);
title("GRB Value",FontSize=16); colorbar;

%% 4) L*a*b
clear difference_h difference_s difference_v hue hue_grb saturation...
    saturation_grb value value_grb picasso_grb picasso_hsv picasso_hsv_grb
close all
clc

%% 4.2) Convert and Display in L*a*b
close all
clc
picasso_lab = rgb2lab(picasso);
L = picasso_lab(:,:,1);     % Lightness Channel [0 100]
a = picasso_lab(:,:,2);     % a Color Channel   [-100 100]
b = picasso_lab(:,:,3);     % b Color Channel   [-100 100]
% imshow(L,[0 100]); title("L Channel",FontSize=16); colorbar;
% imshow(a,[-100 100]); title("a Channel",FontSize=16); colorbar;
% imshow(b,[-100 100]); title("b Channel",FontSize=16); colorbar;
subplot(1,3,1); imshow(L,[0 100]); title("L Channel",FontSize=16); colorbar;
subplot(1,3,2); imshow(a,[-100 100]); title("a Channel",FontSize=16); colorbar;
subplot(1,3,3); imshow(b,[-100 100]); title("b Channel",FontSize=16); colorbar;
colormap

%% 5) Compare color spaces
clear picasso_lab L a b
close all
clc

%% RGB Color Space
picasso_rgb_m = picasso_rgb;
picasso_rgb_m(:,:,1) = 1 - picasso_rgb(:,:,1);
% Mirroring the Red Channel

%% Manipulated Channel
subplot(1,2,1);
imshow(picasso_rgb(:,:,1)); title("Red channel without manipulation",FontSize=16); colorbar;
subplot(1,2,2);
imshow(picasso_rgb_m(:,:,1)); title("Mirrored Red channel",FontSize=16); colorbar;

%% Color Image
subplot(1,2,1); imshow(picasso_rgb); title("RGB without Manipulation",FontSize=16); colorbar;
subplot(1,2,2); imshow(picasso_rgb_m); title("RGB with mirrored Red channel",FontSize=16); colorbar;

%% CYMK Color Space
clear picasso_rgb_m
close all
clc
[cyan, yellow, magenta, black] = dip_rgb2cymk(picasso_rgb);
cyan_m = magenta; magenta_m = cyan;
% Switching between Cyan and Magenta Channels

%% Manipulated Channel
subplot(2,2,1); imshow(cyan); title("Original Cyan"); colorbar;
subplot(2,2,2); imshow(magenta); title("Original Magenta"); colorbar;
subplot(2,2,3); imshow(cyan_m); title("Cyan Switched with Magenta"); colorbar;
subplot(2,2,4); imshow(magenta_m); title("Magenta Switched with Cyan"); colorbar;

%% Color Image
subplot(1,2,1); imshowCYMK(cyan,yellow,magenta,black); colorbar;
title("CYMK without Manipulation",FontSize=16);
subplot(1,2,2); imshowCYMK(cyan_m,yellow,magenta,black); colorbar;
title("CYMK with Cyan and Magenta channels switched",FontSize=16);

%% HSV Color Space
clear cyan yellow magenta black cyan_m magenta_m
close all
clc
picasso_hsv = dip_rgb2hsv(picasso_rgb);
hue = picasso_hsv(:,:,1);
saturation = picasso_hsv(:,:,2);
value = picasso_hsv(:,:,3);
hue_m = mean_filter(hue,71);
% Applying Mean Filter with k=71 on hue channel

%% Manipulated Channel
subplot(1,2,1);
imshow(hue); title("Hue without Manipulation",FontSize=16); colorbar;
subplot(1,2,2);
imshow(hue_m); title("Hue with Mean Filter with k=71",FontSize=16); colorbar;
colormap('hsv');

%% Color Image
subplot(1,2,1);
imshowHSV(hue,saturation,value); title("HSV without Manipulation",FontSize=16); colorbar;
subplot(1,2,2);
imshowHSV(hue_m,saturation,value); title("HSV with Mean on Hue Channel",FontSize=16); colorbar;

%% L*a*b Color Space
clear hue saturation value hue_m
close all
clc
picasso_lab = rgb2lab(picasso);
L = picasso_lab(:,:,1);
a = picasso_lab(:,:,2);
b = picasso_lab(:,:,3);
L_m = 100-L;
% Mirroring the Lighness Channel

%% Manipulated Channel
subplot(1,2,1);
imshow(L,[0 100]); title("Lightness channel without manipulation",FontSize=16); colorbar;
subplot(1,2,2);
imshow(L_m,[0 100]); title("Mirrored Lightness channel",FontSize=16); colorbar;

%% Color Image
subplot(1,2,1); imshowLab(L,a,b); title("Lab without Manipulation",FontSize=16); colorbar;
subplot(1,2,2); imshowLab(L_m,a,b); title("Lab with mirrored L channel",FontSize=16); colorbar;

clear L a b L_m

%% 6) Playing With Colors
clear variables
close all
clc

%% 6.1) Color Segmentation
clear variables
close all
clc
findcap("cap1.png");
findcap("cap2.png");
findcap("cap3.png");