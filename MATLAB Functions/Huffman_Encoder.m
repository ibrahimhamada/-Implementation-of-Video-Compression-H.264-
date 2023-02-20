function [encoded_bits, dictionary] = Huffman_Encoder(input_seq)

% input : the sequence to be encoded
% encoded_file : output the final stream of the huffman encoder 
% dictionary : the dictionary for the encoded file

% Getting the Huffman Codes for the Characters based on their probabilities
dictionary = GetHuffmanCodes(input_seq);
dict_length = length(dictionary.code);

% Iterating over each character in the Message
encoded_bits = '';
for i = 1:1:length(input_seq)
    symb_indx= find(dictionary.symbol == input_seq(i));
    symb_code = dictionary.code{symb_indx};
    encoded_bits = [encoded_bits symb_code];
end

end
