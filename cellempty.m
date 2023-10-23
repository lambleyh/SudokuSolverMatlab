%crop matrix based on cellfinder.m
%returns one of nine cells to be manipulated (3x3x9)

function [A] = cellempty(c,l,A)

if c == 1
    A(1:3,1:3,l) = 0;
elseif c == 2
    A(1:3,4:6,l) = 0;
elseif c == 3
    A(1:3,7:9,l) = 0;
elseif c == 4
    A(4:6,1:3,l) = 0;
elseif c == 5
    A(4:6,4:6,l) = 0;
elseif c == 6
    A(4:6,7:9,l) = 0;
elseif c == 7
    A(7:9,1:3,l) = 0;
elseif c == 8
    A(7:9,4:6,l) = 0;
elseif c == 9
    A(7:9,7:9,l) = 0;
end

end