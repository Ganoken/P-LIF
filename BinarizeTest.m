close all; clear BI;
fid2=fopen(sprintf(''),'r'); % Input File
X_Pixels = 1024;
Y_Pixels = 1024;
Pixels = X_Pixels*Y_Pixels; % # of total pixels
first_frame=1; % The specific Image you want to look at
frames=1;
fseek(fid2,(first_frame-1)*Pixels*2,'bof');
I=zeros(Pixels,frames,'uint16');
for n=1:1:frames
    I(:,n)=(fread(fid2,Pixels,'uint16'));
end
fclose(fid2);
N = [X_Pixels Y_Pixels frames]; % structure of data
RawImages=permute(reshape(I,N),[2 1 3]);
ImageData = RawImages(400:700,480:800); % change acording to your need
level = graythresh(ImageData) % Threshold value
BW = imbinarize(ImageData,level);
imshow(BW) % show image 
