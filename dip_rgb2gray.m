% 1.4) Convert RGB image to Graysacle image
function img_g = dip_rgb2gray(img)
    img_g = 0.2989*img(:,:,1) + 0.5870*img(:,:,2) + 0.1140*img(:,:,3);
end