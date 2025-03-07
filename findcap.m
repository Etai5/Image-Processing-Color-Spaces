%% 6) Color Segmentation
function findcap(img)
    cap = imread(img);
    cap = double(cap);
    cap = (cap-min(cap(:)))/(max(cap(:))-min(cap(:)));
    original_cap = cap;
    [c,y,m,~] = dip_rgb2cymk(cap);
    cap_hsv = dip_rgb2hsv(cap);
    s = cap_hsv(:,:,2);
    v = cap_hsv(:,:,3);
    s_mask = s>0.5 & s<0.75;
    subplot(2,3,1); imshow(s_mask); title("HSV-Saturation Mask 0.5<S<0.75",FontSize=16);
    v_mask = v<0.2;
    subplot(2,3,2); imshow(v_mask); title("HSV-Value Mask V<0.2",FontSize=16);
    c_mask = c>0.5 & c<0.8;
    subplot(2,3,3); imshow(c_mask); title("CYMK-Cyan Mask 0.5<C<0.8",FontSize=16);
    m_mask = m>0.4 & m<0.65;
    subplot(2,3,4); imshow(m_mask); title("CYMK-Magenta Mask 0.4<M<0.65",FontSize=16);
    y_mask = y<0.2;
    subplot(2,3,5); imshow(y_mask); title("CYMK-Yellow Mask Y<0.2",FontSize=16);
    cymk_hsv_mask = double(c_mask & m_mask & y_mask & s_mask & v_mask);
    subplot(2,3,6); imshow(cymk_hsv_mask); title("CYMK & HSV Masks",FontSize=16)
    mask = mean_filter(cymk_hsv_mask,21);
    subplot(1,2,1); imshow(mask); title("Mean Filter with k=21",FontSize=16)
    mask(mask<0.1) = 0;
    subplot(1,2,2); imshow(mask); title("High Pass filter with Mask>0.1",FontSize=16)
    [rows, cols] = find(mask);
    row_d = max(rows) - min(rows);
    col_d = max(cols) - min(cols);
    radius = max(row_d,col_d)/2;
    X = floor((max(cols)+min(cols))/2); Y = floor((max(rows)+min(rows))/2);
    segmented_cap = insertShape(original_cap,"circle",[X Y radius]);
    close all
    imshow(segmented_cap);
end