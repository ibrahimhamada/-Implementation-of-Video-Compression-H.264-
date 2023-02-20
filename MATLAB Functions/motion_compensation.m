function [ diff_frame] = motion_compensation(I,p,image_motion_vector, qtable)

s = 16;

[R,C] = size(I);
diff_frame = zeros(R,C);
k = 1;
p = double(p);

% Encoding and decoding I at the encoder to compensate for errors at
% decoder 

[out_jpeg] = encode_jpeg(I, qtable); % still using MATLAB huffman though ----> need to be replaced 
I_recon = decode_jpeg(out_jpeg, R, C, qtable);

for r = 1 : s : R - s + 1
    for c = 1 : s : C - s + 1
        
        % get corresponding block from p frame
        macro_block = p(r : r + s - 1, c :c + s - 1);
        
        m_vector = image_motion_vector(k : k+1);
        i= m_vector(1); 
        j= m_vector(2);
        Block = I_recon( i : i + s - 1 , j : j + s - 1 );
        k = k+2;
        
        % construct diff frame by subtracting p from I_reconstructed 
        diff_frame(r : r + s - 1, c :c + s - 1 ) = macro_block - Block;

    end    
end

end 