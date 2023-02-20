function code = Find_Code(L , H)

% initialize codeword,start and end points of probability range 
code = ''; 
start_point = 0;
half = 0.5;
end_point = 1;

while ~(L <= start_point && H >= end_point) % exit condition: when the block specified by start_point and end_point is totally included in [L,H]
    
    if H <= half % Check if the lower block includes the L,H  
        end_point = half;
        code = [code '0'];
    elseif L >= half %% Check if the upper block includes the L,H
        start_point = half;
        code = [code '1'];
    elseif L < half && H > half % Check for special case where L and H are stuck between lower and upper halves 
        if H - half < half - L % Choose lower block if H is nearer to the half point
            end_point = half;
            code = [code '0'];
        else % Choose upper block if L is nearer to the half point  
            start_point = half;
            code = [code '1'];
        end
            
    end
    half = vpa(vpa(start_point + end_point)/2);
        
end
if H == end_point % H can not equal the higher end point 
    code = [code '0']; %% so that the block is totally included in [L,H)
end 
end