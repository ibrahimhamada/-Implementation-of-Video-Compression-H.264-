function result = IDCT(freq_block)
% block reprsesnts original image 

result = zeros(8,8);
basis = zeros(8,8);

%looping over the size of the basis and size of the input
for u = 0:1:7
    for v = 0:1:7
        for x = 0:1:7
            for y = 0:1:7
                basis(x+1,y+1) = cos(((2*x+1)*u*pi)/16)*cos(((2*y+1)*v*pi)/16); %constructing the basis block
            end
        end 
        % multiplying each value of encoded_block to the corresponding
        % basis block and summing the result and storing it in the result_Idct block
        result = result + freq_block(u+1,v+1).*basis;
    end 
end
end 