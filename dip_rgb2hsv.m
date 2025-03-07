% 3.2) Convert RGB image to HSV
function img_hsv = dip_rgb2hsv(img)
    [n ,m, l] = size(img);
    img_hsv = zeros(n,m,l);
    % red = img(:,:,1);
    % green = img(:,:,2);
    % blue = img(:,:,3);
    Cmax = max(img,[],3);   % maximum value of each rgb pixel
    Cmin = min(img,[],3);   % minimum value of eacg rgb pixel
    delta = Cmax-Cmin;      % difference between the maximum and minimum value of each pixel

    % Hue
    for i = 1:n
        for j = 1:m
            if delta(i,j) == 0  % all channels are of the same value
                img_hsv(i,j,1) = 0;

            elseif Cmax(i,j) == img(i,j,1)  % Cmax is in Red channel
                img_hsv(i,j,1) = (60/360) * mod((img(i,j,2)-img(i,j,3))/delta(i,j),6);

            elseif Cmax(i,j) == img(i,j,2)  % Cmax is in Green channel
                img_hsv(i,j,1) = (60/360) * ((img(i,j,3)-img(i,j,1))/delta(i,j)+2);

            else    % Cmax is in Blue channel
                img_hsv(i,j,1) = (60/360) * ((img(i,j,1)-img(i,j,2))/delta(i,j)+4);
            end
        end
    end

    % Saturation
    for i = 1:n
        for j = 1:m
            if Cmax(i,j) == 0   % the pixel is pure 0
                img_hsv(i,j,2) = 0;
            else
                img_hsv(i,j,2) = delta(i,j)/Cmax(i,j);
            end
        end
    end

    % Value
    img_hsv(:,:,3) = Cmax;
end