function out = pad(I,d)
% I: input image
% out: output the padded image if needed

[R,C]=size(I);
%check if the size of the image is divisable by 8, otherwise pad 
if mod(R,d) ~= 0 && mod(C,d) == 0
    p = d - mod(R,d) ;
    I = [ I ; zeros(p,C)];

elseif mod(C,d) ~= 0 && mod(R,d) == 0

    p = d - mod(C,d) ;
    I = [ I , zeros(R,p)];

elseif mod(C,d) ~= 0 && mod(R,d) ~= 0
    
    p1 = d - mod(R,d) ;
    p2 = d - mod(C,d) ;
    I = [ I ; zeros(p1,C)];
    [R,C]=size(I);
    I = [ I , zeros(R,p2)];
end 
out = I;
end 