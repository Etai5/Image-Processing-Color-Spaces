% 2.2) Convert RGB image to CYMK Channels
function [cyan, yellow, magenta, black] = dip_rgb2cymk(img)
    black = min(1-img,[],3);    % Black Channel
    cyan = (1-img(:,:,1)-black)./(1-black); % Cyan Channel
    magenta = (1-img(:,:,2)-black)./(1-black);  % Magenta Channel
    yellow = (1-img(:,:,3)-black)./(1-black);   % Yellow Channel
end