function out_code = run_length_decoder(input_code)
% input_code: input stream of  
% converting the count of zeros to consecutive zeros 

out_code = [];
i = 1;

while(i<=length(input_code))
    if input_code(i) == 0
        counter = input_code(i+1);
        for k = 1:1:counter
            out_code = [out_code 0];
        end
        i = i+2;
    else
        out_code = [out_code input_code(i)];
        i = i+1;
        
    end
end
end