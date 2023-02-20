function one_D = serpentine(two_D)
% two_D: input of 2D vector
% one_D: output 1D vector

N = 8;
diagonals = 2*N; % the possible number of diagonals for a block NxN size
one_D = [];

% looping over the possible numbers of diagonals in the block
for k = 1:diagonals-1
    if k <= N  % fisrt N(1-->8) loops are in the upper part 
        if mod(k,2)==0 
            j=k;
            for i=1:k   % increasing the rows while decreasing the columns
                one_D = [one_D two_D(i,j)];
                j = j-1;
            end
        else
            i=k;
            for j=1:k % increasing the columns while decreasing the rows
                one_D = [one_D two_D(i,j)];
                i=i-1;
            end
        end
    else  % second N(9-->15) loops are in the lower part 
        if mod(k,2)==0
            p = mod(k,N);
            j = N ;
            for i = p+1:N % increasing the rows while decreasing the columns
                one_D = [one_D two_D(i,j)];
                j = j-1;
            end
        else
            p = mod(k,N);
            i=N;
            for j = p+1:N % increasing the columns while decreasing the rows
                one_D = [one_D two_D(i,j)];
                i =i-1;
            end
        end
    end
end



