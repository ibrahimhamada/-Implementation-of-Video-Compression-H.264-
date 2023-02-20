%% This funciton takes the message to be encoded. Probability is calculated firstly to find the codes for each symbol
% by finding the unique characters, then finding the frequency of each symbol.
function dictionary = GetHuffmanCodes(message)
% input : the sequence to be encoded
% dictionary : the dictionary for the encoded file

message_len = length(message);  %Sequence Length
symbs = unique(message);        %Unique symbols of the message
symbs_freq = zeros(1, length(symbs));  %Temp freq vector
probability = zeros(1, length(symbs)); %Temp prob vector

%Iterating over all unique symbols
for i = 1:length(symbs)
    symbs_freq(i) = length(strfind(message, symbs(i)));
    probability(i) = symbs_freq(i) / message_len;
end

%Intialize empty cell arrays to have code words and probability
for i = 1:length(probability)   
    codewords{i} = '' ; 
    symb{i} = i;
end

% Iterating to find codes
while (probability(1) < 1 && length(probability) >1)
    [~, arranged] = sort(probability); % Sorting the probabilities.
    % Indexing the least two probabilities and their char values.
    least_prop_index = arranged(1); 
    next_least_prop_index = arranged(2);
    least_char = symb{least_prop_index};
    next_least_char  = symb{next_least_prop_index};
    % Probability to be summed
    least_prop = probability(least_prop_index);
    next_least_prop  = probability(next_least_prop_index);
    
    merged_set = [least_char, next_least_char];  
    new_prob   = least_prop + next_least_prop; 
    symb(arranged(1:2)) = '';  % Update symbol sets
    probability(arranged(1:2))   = '';
    symb = [symb merged_set];
    probability   = [probability new_prob];
    % Get the updated codeword.
    codewords = UpdateCodeWord(codewords,least_char,'1');
    codewords = UpdateCodeWord(codewords,next_least_char,'0');
end

dictionary.symbol = symbs ; dictionary.code = codewords;
    
end