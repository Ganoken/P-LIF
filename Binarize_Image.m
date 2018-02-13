%Code for Binarizing large number of image(Intended for .mraw).
%Sujoy  created 2017/10

%Initialize
close all; clear BinarizeImage;

%Load Data 
FileID = fopen(sprintf(''),'r'); %input file

%Set parameters
X_Pixels = 1024; % Based on camera
Y_Pixels = 1024;
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image 
N = [X_Pixels Y_Pixels]; % structure of data

%Generate needed matrix
I=zeros(Pixels,1,'uint16'); % Pre make the matrix to hold the image
BinarizeImage=zeros(301,321,20000); % Pre make output matrix

%Set up loop parameters
ji=1; % initial image
jf=20000; % end image 

%main loop   
for j=ji:jf
    fseek(FileID,(j-1)*Pixels*2,'bof'); % find the start point 
    I=(fread(FileID,Pixels,'uint16')); % load the image data 
    RawImages=permute(reshape(I,N),[2 1]); % Organize 
    %level(:,j) = graythresh(RawImages(400:700,480:800)); % to obtain the value
    BinarizeImage(:,:,j-((l-1)*2000)) = imbinarize(RawImages(400:700,480:800)); 
end

%Save
FileName = ['.mat']; % output file name
save(FileName,'BinarizeImage');  
%finish up
fclose(FileID); % close file
