%Save serieas of meanimages according to there pahse
%Sujoy 2017/11
 
Phase = zeros ((length(TimeUse)-1),2,PhaseDivision,'uint16'); %contains the position and # of images for certain phase 
pos = 1; %Psition of image
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

numArrays = 10;
BI = cell(numArrays,1);
for n = 1:numArrays
    FileName = ['../../LIF/BinarizeImage/20170104L_75_on_1_201701_1147' num2str(n,'%03u') '.mat'];
    BI{n} = load(FileName);
end

MeanImage = zeros(301,321,PhaseDivision);
PhaseImage = zeros(301,321,700); %700 is an arbitary number
for j=1:PhaseDivision
    %k=1;
    m=1;
    for k=1:(length(TimeUse)-1)
        if Phase(k,1,j) == 0
            break
        end
        for l=1:Phase(k,2,j)
            if (Phase(k,1,j)+l-1) <= 2000
                    PhaseImage(:,:,m) = BI{1}.BinarizeImage(:,:,Phase(k,1,j)+l-1);
            elseif (Phase(k,1,j)+l-1) <= 4000
                    PhaseImage(:,:,m) = BI{2}.BinarizeImage(:,:,Phase(k,1,j)+l-2001);
            elseif (Phase(k,1,j)+l-1) <= 6000
                   PhaseImage(:,:,m) = BI{3}.BinarizeImage(:,:,Phase(k,1,j)+l-4001);
            elseif (Phase(k,1,j)+l-1) <= 8000
                    PhaseImage(:,:,m) = BI{4}.BinarizeImage(:,:,Phase(k,1,j)+l-6001);
            elseif (Phase(k,1,j)+l-1) <= 10000
                    PhaseImage(:,:,m) = BI{5}.BinarizeImage(:,:,Phase(k,1,j)+l-8001);
            elseif (Phase(k,1,j)+l-1) <= 12000
                    PhaseImage(:,:,m) = BI{6}.BinarizeImage(:,:,Phase(k,1,j)+l-10001);
            elseif (Phase(k,1,j)+l-1) <= 14000
                    PhaseImage(:,:,m) = BI{7}.BinarizeImage(:,:,Phase(k,1,j)+l-12001);
            elseif (Phase(k,1,j)+l-1) <= 16000
                    PhaseImage(:,:,m) = BI{8}.BinarizeImage(:,:,Phase(k,1,j)+l-14001);
            elseif (Phase(k,1,j)+l-1) <= 18000
                    PhaseImage(:,:,m) = BI{9}.BinarizeImage(:,:,Phase(k,1,j)+l-16001);
            else
                    PhaseImage(:,:,m) = BI{10}.BinarizeImage(:,:,Phase(k,1,j)+l-18001);
            end
            
            m=m+1;
        end
    %k=k+1;
    
    end
    SumImage = sum(PhaseImage,3);
    MeanImage(:,:,j) = SumImage/(m-1);
    %MeanImage(:,:,j) = SumImage/length
end

FileName = '../../Output/MeanImage/20170104L_75_on_1_201701_1147mean.mat'; % output file name
save(FileName,'MeanImage');  