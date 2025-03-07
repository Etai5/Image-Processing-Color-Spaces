% 2.2.1) Mean Filter
function mean_img = mean_filter(img,k)
    [n,m] = size(img);  % dims of rows and columns
    u = floor(k/2);     % used to define the enlargment of the matrix to fit the filter
    temp_img = zeros(n + 2*u, m + 2*u);     % creating the new sized matrix
    temp_img(u+1:n+u , u+1:m+u) = img;      % creating the padded matrix
    mean_img = img;     % creating the output matrix with the right sizes
    H = ones(k)/(k^2);      % the mean filter
    for i = 1:n
        for j = 1:m
            mean_img(i,j) = sum(temp_img(i:i+k-1 , j:j+k-1).*H,"all");  % applying the filter on the pixel
        end
    end
end