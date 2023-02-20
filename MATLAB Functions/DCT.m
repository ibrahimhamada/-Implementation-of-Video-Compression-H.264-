function result = DCT(spatial_block)
% block reprsesnts original image 

result = zeros(8,8);
basis = zeros(8,8);

spatial_block = double(spatial_block);

%looping over the size of the basis and size of the input
for u = 0:1:7
    for v = 0:1:7
        for x = 0:1:7
            for y = 0:1:7
                basis(x+1,y+1) = cos(((2*x+1)*u*pi)/16)*cos(((2*y+1)*v*pi)/16); % constructing the basis function
            end
        end 
        % multiplying each pixel to the corresponding basis block and averaging them then storing in dct_result
        result(u+1,v+1) = sum(spatial_block.*basis,'all');
    end 
end
 result(:,1) = result(:,1)/2;
 result(1,:) = result(1,:)/2;
 result = result/16;

end 