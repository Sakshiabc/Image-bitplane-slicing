%% Bit plane slicing %%
clc;    %clear command window
clear;   %clear workspace
close;   %close all current figures
a=imread('lena.bmp');
figure(1);   %figure number
imshow(a);   %displaying the image
title('original image');  %title of image
[m, n, o]=size(a);  %storing length of each dimension in a seperate variable
figure(2);
imshow(a(:,:,1));   %displaying the first plane (red plane)
title('red plane');
figure(3);
imshow(a(:,:,2));  %displaying the second plane (blue plane)
title('blue plane');
figure(4);
imshow(a(:,:,3));   %displaying the third plane (green plane)
title('green plane');

%Displaying all the planes
R(:,:)=a(:,:,1);   %all rows and columns of first plane to variable R
for i=1:m                %all rows
    for j=1:n           % all columns
        for k=1:8        % 8 number of planes
            bitplaneR(i,j,k)=bitget(a(i,j,1),k);    %returns the bit value at position kth bit in integer array a.
        end
    end
end
for i=1:8
    figure(5);
    subplot(2,4,i);   %ploting all 8 planes
    titleString='bit planes (red plane)';
    imagesc(uint8(bitplaneR(:,:,i)));  %displays the data in array R as an image that uses the full range of colors in the colormap. 
    axis equal;
    colormap(gray);  %Plot a surface and assign the gray colormap.
    title([titleString int2str(i-1)]);    %giving title to each and every plots
end 

G(:,:)=a(:,:,3);  %all rows and columns of second plane to variable R
for i=1:m
    for j=1:n
        for k=1:8
            bitplaneG(i,j,k)=bitget(a(i,j,3),k);
        end
    end
end
for i=1:8
    figure(6);
    subplot(2,4,i);
    titleString='bit planes (green plane)';
    imagesc(uint8(bitplaneG(:,:,i)));
    axis equal;
    colormap(gray);
    title([titleString int2str(i-1)]);
end

B(:,:)=a(:,:,2);    %all rows and columns of third plane to variable R
for i=1:m
    for j=1:n
        for k=1:8
            bitplaneB(i,j,k)=bitget(a(i,j,2),k);
        end
    end
end
for i=1:8
    figure(7);
    subplot(2,4,i);
    titleString='bit planes (red plane)';
    imagesc(uint8(bitplaneB(:,:,i)));
    axis equal;
    colormap(gray);
    title([titleString int2str(i-1)]);
end