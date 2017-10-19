% Code to determine the region for binarization
% Sujoy created 2017/10

close all; clear BW;
fid2=fopen(sprintf(''),'r'); % Input File
X_Pixels = 1024;
Y_Pixels = 1024;
Pixels = X_Pixels*Y_Pixels; % # of total pixels
first_frame=1; % The specific Image you want to look at
fseek(fid2,(first_frame-1)*Pixels*2,'bof');
I=zeros(Pixels,1,'uint16');
I(:,1)=(fread(fid2,Pixels,'uint16'));
fclose(fid2);
N = [X_Pixels Y_Pixels]; % structure of data
RawImages=permute(reshape(I,N),[2 1]);
ImageData = RawImages(400:700,480:800); % change acording to your need
level = graythresh(ImageData) % Threshold value
BW = imbinarize(ImageData,level);
imshow(BW) % show image 
