function [L,H]= Find_Range(word,symbols,props)
% Check the sum of propbabilities is equal 1
if round(sum(props)) == 1
%initialize the ranges line
line = zeros(1,length(props)+1);
number_of_points = length(line);
line(1) = 0;
line(2:number_of_points) = props;
for i=2:number_of_points
   line(i) = line(i-1)+line(i); 
end
line1 = line;
for i=1:length(word)
    % get the index of the letter
    current_symbol = find(symbols==word(i));
    new_range_start = vpa(line(current_symbol));
    new_range_end = vpa(line(current_symbol+1));
    new_range_diff = vpa(new_range_end-new_range_start,5);
    line = line1*new_range_diff+new_range_start*ones(1,number_of_points);
    
end
L = line(1);
H = line(number_of_points);
end
end