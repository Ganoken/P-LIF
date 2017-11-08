%Code for Binarizing large number of image(Intended for .mraw).
%Sujoy  created 2017/10

%Initialize
close all; clear BinarizeImage;
%Load Data 
FileID = fopen(sprintf(''),'r'); %input file
%Set parameters
X_Pixels = 1024;
Y_Pixels = 1024;
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image 
N = [X_Pixels Y_Pixels]; % structure of data
%Generate needed matrix
I=zeros(Pixels,1,'uint16'); % Pre make the matrix to hold the image
BinarizeImage=zeros(301,321,2000); % Pre make output matrix
%Set up loop parameters
ji=1; % initial image
jf=2000; % end image for first run
%main loop
for l=1:10 % Each loop will proccess 2000 images 
    %s=1; % ID for store
    for j=ji:jf
        first_frame=j;
        fseek(FileID,(first_frame-1)*Pixels*2,'bof');
        I(:,1)=(fread(FileID,Pixels,'uint16'));
        RawImages=permute(reshape(I,N),[2 1]);
        %level(:,s) = graythresh(RawImages(400:700,480:800)); % to obtain the th value
        BinarizeImage(:,:,j-((l-1)*2000)) = imbinarize(RawImages(400:700,480:800));
        %s=s+1;
    end
    ji=ji+2000; % To process next 2000 image
    jf=jf+2000; % same as above
    FileName = ['' num2str(l,'%03u') '.mat']; % output file name
    save(FileName,'BinarizeImage');  
end
%finish up
fclose(FileID); % close file
