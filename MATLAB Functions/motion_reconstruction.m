function p = motion_reconstruction(I, diff_frame , image_motion_vector)

s = 16;

[R,C] = size(diff_frame);

p = zeros(R,C);
k = 1;
I = double(I);

for r = 1 : s : R - s + 1
    for c = 1 : s : C - s + 1
        
        % replicate motion compensation at the encoder but now add 
        
        macro_block = diff_frame(r : r + s - 1, c :c + s - 1);
        m_vector = image_motion_vector(k : k+1);
        i= m_vector(1); 
        j= m_vector(2);
        Block = I( i : i + s - 1 , j : j + s - 1 );
        k = k+2;
      
        p(r : r + s - 1, c :c + s - 1 ) = macro_block + Block;

    end    
end
p = uint8(p);
%imshow(uint8(p));

end 

