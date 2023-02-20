function [image_motion_vector ] = motion_estimation(I,P)

[R,C] = size(I);
image_motion_vector = [];

% M and N specify the search area around the macro-block
M = 1;
N = 1;

%specifies  the size of the macro block s*s ------> I think we should add
%padding just in case (already using padding for jpes encoding though)
s = 16;

for r = 1 : s : R - s + 1
    for c = 1 : s : C - s + 1

        %search M x N neighborhoud around the block for best match  
        
        residual = Inf;
        Block_min = [];
        m_vector = 0;
        macro_block = P(r : r + s - 1, c :c + s - 1) ;
        
        start_r = r - M;
        end_r = r + s + M;
        
        start_c = c - N;
        end_c = c + s + N;
        
        if start_r < 1
            start_r = 1;
        end 
        
         if start_c < 1
            start_c = 1;
         end 
         
         if end_r > R - s
            end_r = R - s;
         end 
         
         if end_c > C - s
            end_c = C - s;
        end 
        
        for i = start_r:1:end_r
            for j = start_c:1:end_c 
                
                block = I(i: i + s - 1, j : j + s - 1);
                diff = sum((macro_block - block).^2,'all');
                if diff < residual
                    % using energy of the residual as a metric 
                    residual = diff;
                    Block_min = block;
                    m_vector = [i,j];
                end 
                
            end
        end 
        % concatenate the motion vector of ech macroblock to be used in the
        % motion compensation function.
        image_motion_vector = [image_motion_vector m_vector];
    end    
end



end 