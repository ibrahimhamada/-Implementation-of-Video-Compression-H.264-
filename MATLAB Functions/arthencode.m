function code = arthencode(word,symbols,props)
% Inputs:
% word is the input sequence of symbols 
% symbols is the whols set of symbols produced by the source 
% props is the probabilities of the corresponding symbols  

% Calling functions to get the code from given inputs 

[L,H] = Find_Range(word ,symbols ,props);
code = Find_Code(L,H);

end 