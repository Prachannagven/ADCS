%Starting by importing the image into matlabs
img = imread("Clocktower.jpg")
imshow(img)
blockSize = 2 %defining the size of our convolution matrix

%Now we'll split up our image into the R, G and B values
imgBinned = zeros(size(img,1)/blockSize, size(img,2)/blockSize, size(img,3), "uint8")

%Now let's start iterating through the original img matrix
for i=1:blockSize:size(img,1)
    for j=1:blockSize:size(img,2)
        for k=1:1:size(img,3)
            tempSubMatrix = img(i:i+blockSize-1, j:j+blockSize-1, k)
            imgBinned(i,j,k) = ceil(mean(mean(tempSubMatrix)))
        end
    end
end

%Now the best part, showing the image
imshow(imgBinned)
