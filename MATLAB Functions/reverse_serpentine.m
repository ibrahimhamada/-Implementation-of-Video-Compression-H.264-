function two_D = reverse_serpentine(one_D)
% one_D: input 1D vector
% two_D: output 2D vector
N = 8;
two_D = zeros(8,8);
v = 1;

for k = 1:2*N-1
    if k <= N
        if mod(k,2)==0
            j=k;
            for i=1:k
               two_D(i,j)= one_D(v);
                j = j-1;
                v = v+1;
            end
        else
            i=k;
            for j=1:k
                two_D(i,j)= one_D(v);
                i=i-1;
                v = v+1;
            end
        end
    else
        if mod(k,2)==0
            p = mod(k,N);
            j = N ;
            for i = p+1:N
                two_D(i,j)= one_D(v);
                j = j-1;
                v = v+1;
            end
        else
            p = mod(k,N);
            i=N;
            for j = p+1:N
                 two_D(i,j)= one_D(v);
                i =i-1;
                v = v+1;
            end
        end
    end
end



