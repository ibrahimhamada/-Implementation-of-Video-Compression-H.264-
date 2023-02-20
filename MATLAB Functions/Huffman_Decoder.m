
function decoded_seq = Huffman_Decoder(encoded_message, dictionary)
% input : Encoded bits that are recieved by reciever and dictionary used to encode the symbols.
% output: decoded_seq : restored decoded symbols  

decoded_seq=[];  %temp vector for decoded seq
bitstream_len = length(encoded_message);  %length of the received bitstream
i=1;
j=0;
%looping over bitstream
while i<=bitstream_len
        c = encoded_message(i:i+j);  %append one bit till it matches one of the codes in dictionary
        matched_codes = find(string(dictionary.code) == c); %matched codes that share same prefix with c
        %correct code is detected
        if(length(matched_codes)==1)
            decoded_seq=[decoded_seq dictionary.symbol(matched_codes)];  %append decoded symbols
            i=i+j+1;
            j=0;
        end
        j=j+1;
end
end