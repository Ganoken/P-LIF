function filtered = applyfilter (filter,RawData)
%Apply filter to the signal 'RawData'
%Sujoy created 2017/10

    filtered = filtfilt(filter,RawData);

end