function filter = generatefilter(type,frequency1,frequency2,Rate)
%function for generating filter
%type : type of filter, 0 bandpass, 1 bandstop
%frequency1 : lower end frequency
%frequency2 : higher end frequency
%Rate : Sampling frequency

    if type == 0
        filter = designfilt('bandpassiir','FilterOrder',20, ...
        'HalfPowerFrequency1',frequency1,'HalfPowerFrequency2',frequency2, ...
        'SampleRate',Rate);
    else if type == 1
        filter = designfilt('bandstopiir','FilterOrder',20, ...
        'HalfPowerFrequency1',frequency1,'HalfPowerFrequency2',frequency2, ...
        'DesignMethod','butter','SampleRate',Rate);
    end
end