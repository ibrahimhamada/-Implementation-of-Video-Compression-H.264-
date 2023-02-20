function [total_code,prop,symbol]= arthencodewrap(frames)

message_len = length(frames);  %Sequence Length
symbols = unique(frames);        %Unique symbols of the message
symbs_freq = zeros(1, length(symbols));  %Temp freq vector
props = zeros(1, length(symbols)); %Temp prob vector

%Iterating over all unique symbols
for i = 1:length(symbols)
    symbs_freq(i) = length(strfind(frames, symbols(i)));
    props(i) = symbs_freq(i) / message_len;
end

total_code = [];
for i = 1:5:length(frames)-5+1
    word = frames(i : i+4);
    code = arthencode(word,symbols,props);
    % add a seperator between codewords 
    total_code=[total_code code 1000];
end 


end 