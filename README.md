# P-LIF
Analysis Code for LIF
Binarize and Phase Mean

Run Binarize_image.m first, set the filename under FileID.  
If you want use only part of your image check the region with BinarizeTest.m, 
then set the number at Binarize_image.m under imbinarize(RawImages(400:700,480:800)); then set the BinarizeImage variable accordingly.  
Finally set your output file name under FileName.
It will generates 10 .mat file containing the binarized image. (You can use MemL branch which only generates one .mat file)  

Next run the DeterminePhase.m. Set %% initialize and load data section according to your data.  
If you do not need to apply filter to your data comment out that portion. (*Important*)  
If you need set the numbers as desired.  
Set the 'MinPeakDistance' of findpeaks as desired. Also change the input file name if you have changed the filter setting.  
_Do not clear the variables as it will be used in next step._  

Finally run the PhaseMean.m. Set the input and output file name.  
Set the size of your image for  MeanImage and PhaseImage.  


