%crop matrix based on cellfinder.m
%returns one of nine cells to be manipulated (3x3x9)

function [C] = crop(c,l,A)

if c == 1
    C = A(1:3,1:3,l);
elseif c == 2
    C = A(1:3,4:6,l);
elseif c == 3
    C = A(1:3,7:9,l);
elseif c == 4
    C = A(4:6,1:3,l);
elseif c == 5
    C = A(4:6,4:6,l);
elseif c == 6
    C = A(4:6,7:9,l);
elseif c == 7
    C = A(7:9,1:3,l);
elseif c == 8
    C = A(7:9,4:6,l);
elseif c == 9
    C = A(7:9,7:9,l);
end

end