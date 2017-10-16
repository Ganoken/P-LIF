close all; clear BI; 
FileID = fopen(sprintf(''),'r'); %input file
X_Pixels = 1024;
Y_Pixels = 1024;
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image 
frames=1; % # of frame fix to 1
N = [X_Pixels Y_Pixels frames]; % structure of data
I=zeros(Pixels,frames,'uint16'); % Pre make the matrix to hold the image
BI=zeros(301,321,2000); % Pre make output matrix
ji=1; % initial image
jf=2000; % end image for first run
for l=1:10 % Each loop will proccess 2000 images 
    s=1; % ID for store
    for j=ji:jf
        first_frame=j;
        fseek(FileID,(first_frame-1)*Pixels*2,'bof');
        for n=1:1:frames
            I(:,n)=(fread(FileID,Pixels,'uint16'));
        end
        RawImages=permute(reshape(I,N),[2 1 3]);
        ImageData = RawImages(400:700,480:800);
        %level = graythresh(ImageData); % to obtain the th value
        %BI(:,:,s) = imbinarize(ImageData,level);
        BI(:,:,s) = imbinarize(ImageData);
        s=s+1;
    end
    ji=ji+2000; % To process next 2000 image
    jf=jf+2000; % same as above
    FileName = ['' num2str(l,'%03u') '.mat']; % output file name
    save(FileName,'BI');
    
end
fclose(FileID); % close file
