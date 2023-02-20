function I_rec_crop=decode_jpeg(decode_code, R, C, qtable)

%[encoded_file,dict] = encod_jpeg(original_img)
%7.Use Huffman decoder to decode the Huffman encoded stream:
% file_ID = fopen('encoded.bin');
% compressed_file_rd = fread(file_ID)';
% decode_code = huffmandeco(compressed_file_rd,dict);
Table = QuantizationTable(qtable); % Using low quantization Table 
out_code = run_length_decoder(decode_code); %8.Perform run-length decoding

%9.Transform the 1-D vector into groups of 8x8 matrices:
I_rec = zeros(R,C);
i = 1;
for r = 1 : 8 : R - 7
    for c = 1 : 8 : C-7
        if i + 63 <= length(out_code)
            one_D = out_code(i:i+63);
            blockd1 = reverse_serpentine(one_D);
            blockd2 = blockd1.*Table;  %10.Multiply each group by the quantization tables
            blockd3 = IDCT(blockd2);  %11.Perform IDCT 
            I_rec(r :r + 7 , c : c + 7) = blockd3;  %12.Combine each block into a single image
            i = i + 64;
        end 
    end
end

%I_rec = uint8(I_rec);
I_rec_crop = I_rec; % cropping the image:
% imwrite(I_rec_crop, 'decoded_img_table1.jpeg'); % Save the image
% imshow(I_rec_crop)




end