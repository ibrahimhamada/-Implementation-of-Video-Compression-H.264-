function word = arthdecoder(code,symbols,props,seq_len)

%Initialize word 
word = '';
% Retrive the decimal value (tag) idetifying the sequece from the given binary
% code word 
fracV = co0de - '0';
tag = vpa(fracV * (2 .^ -(1:numel(fracV)).'));

%initialize the ranges line
line = zeros(1,length(props)+1);
number_of_points = length(line);
line(1) = 0;
line(2:number_of_points) = props;
for i=2:number_of_points
   line(i) = line(i-1)+line(i); 
end
line1 = line;

% looping for the length of sequence 
for k=1:1:seq_len
    
    for i=1:1:length(line)-1 % find the symbol for which the range of probabilities will include the value of the given tag 
        if tag> line1(i) && tag < line1(i+1)
            word = [word symbols(i)]; % add symbol to the word 
            new_range_start = vpa(line1(i));
            new_range_end = vpa(line1(i+1));
            new_range_diff = vpa(new_range_end-new_range_start,5);
            line1 = line*new_range_diff+new_range_start*ones(1,number_of_points); % updating range of probabilities
            break
        end
    end
    
end
end
