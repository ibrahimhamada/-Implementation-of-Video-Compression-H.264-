%% This function is used to update the codes of symbols with lowest probabilities in each iteration.
% It takes the codes of all characters and the character to be updated and
% updates the code with the input_code Value
function codewords = UpdateCodeWord(codewords,character,input_code)
    for i = 1:length(character)
        codewords{character(i)} = strcat(input_code,codewords{character(i)});      
    end
end