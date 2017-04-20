a=imread('balloon.png');
a_Togray = rgb2gray(a);
threshold = graythresh(a_Togray);
a_bww = im2bw(a_Togray,threshold);
a_bw=~a_bww;
[labeled,numObjects]=bwlabel(a_bw);
[m,n]=size(a_bw);
s = regionprops(labeled, 'Centroid');
B = bwboundaries(a_bw);
imshow(a_bw)
hold on
for k = 1:numel(s)
c = s(k).Centroid;
text(c(1), c(2), sprintf('%d', k), ...
'HorizontalAlignment', 'center', ...
'VerticalAlignment', 'middle');
 end
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 0.1)
end
x=num2str(numel(s)+3);
hold off

  subplot(1,2,1); imshow(a); title('Original Image');
   subplot(1,2,2); imshow(a_bw); title('Detected Balloons');
   
% Counting the number of objects
   text(35,35,strcat('\color{red}Number of objects Found:', x))