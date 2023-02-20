function out_code = run_length(input_code)
% input_code: input of a 1D stream code
% out_code: output of 1D stream code after performing run-length

out_code = [];
counter = 0;

% looping over the input_code:
for i = 1:1:length(input_code)
    if input_code(i) == 0 % get count of the consecutive zeros 
        counter = counter + 1;
    else
        if counter == 0
            out_code = [out_code input_code(i)];
        else
            out_code = [out_code 0 counter input_code(i)]; % combine the out_code with 0 and their count
            counter = 0;
        end
    end
    
    if i == length(input_code) && input_code(i) == 0 % to check if the last element is zero 
        out_code = [out_code 0 counter];
        counter = 0;
    end 
        
end
end

% Note: we stop counting the consecutive zeros only by knowing the next
% element, so if the last element is zero it won't combine the 0 and its
% count to the array, so construct an if condition to check if the last
% element is zero (not depending on the next element).