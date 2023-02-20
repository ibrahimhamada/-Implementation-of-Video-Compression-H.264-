function Table = QuantizationTable(x)

% x: input to choose table 1 (low) or table 2 (high) compression 
% Table: output return with the chosen table

if x==1  % for Low compression
    Table = [1 1 1 1 1 2 2 4
        1 1 1 1 1 2 2 4
        1 1 1 1 2 2 2 4
        1 1 1 1 2 2 4 8
        1 1 2 2 2 2 4 8
        2 2 2 2 2 4 8 8
        2 2 2 4 4 8 8 16
        4 4 4 4 8 8 16 16];
elseif x==2  % for high compression
    Table=[1 2 4 8 16 32 64 128;
        2 4 4 8 16 32 64 128;
        4 4 8 16 32 64 128 128;
        8 8 16 32 64 128 128 256;
        16 16 32 64 128 128 256 256;
        32 32 64 128 128 256 256 256;
        64 64 128 128 256 256 256 256;
        128 128 128 256 256 256 256 256];
else
    disp('Error in choose X');
end
end

