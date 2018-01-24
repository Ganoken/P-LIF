%Save serieas of meanimages according to there pahse
%Sujoy 2017/11
 
Phase = zeros ((length(TimeUse)-1),2,PhaseDivision,'uint16'); %contains the position and # of images for certain phase 
pos = 1; %Position of image
ImageTimeVector = 0:1/10000:2-(1/10000); %Time vector for camera image used as the position

s=1;
for k=1:(length(TimeUse)-1)
    
    for j=1:PhaseDivision
        x = ImageTimeVector(pos:end) < PhaseTimeStamps (s+1);
        Phase(k,1,j) = pos;
        Phase(k,2,j) = nnz (x);
        pos = pos+nnz(x);
        if pos >= length(ImageTimeVector)
            break
        end
        s = s+1;
    end
    
end

FileName = ['.mat'];
load(FileName);

MeanImage = zeros(301,321,PhaseDivision);
PhaseImage = zeros(301,321,700); %700 is an arbitary number
for j=1:PhaseDivision
        m=1;
    for k=1:(length(TimeUse)-1)
        if Phase(k,1,j) == 0
            break
        end
        for l=1:Phase(k,2,j)
            PhaseImage(:,:,m) = BinarizeImage(:,:,Phase(k,1,j)+l-1);
            m=m+1;
        end
    end
    SumImage = sum(PhaseImage,3);
    MeanImage(:,:,j) = SumImage/(m-1);
end

FileName = '../../Output/MeanImage/20170104L_75_on_1_201701_1147mean.mat'; % output file name
save(FileName,'MeanImage');  