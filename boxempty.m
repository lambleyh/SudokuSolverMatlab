%crop matrix based on cellfinder.m
%returns one of nine cells to be manipulated (3x3x9)

function [A] = boxempty(b,n,A)

for i = 1:length(n)
    
    if b == 1
        A(1:3,1:3,n(i)) = 0;
    elseif b == 2
        A(1:3,4:6,n(i)) = 0;
    elseif b == 3
        A(1:3,7:9,n(i)) = 0;
    elseif b == 4
        A(4:6,1:3,n(i)) = 0;
    elseif b == 5
        A(4:6,4:6,n(i)) = 0;
    elseif b == 6
        A(4:6,7:9,n(i)) = 0;
    elseif b == 7
        A(7:9,1:3,n(i)) = 0;
    elseif b == 8
        A(7:9,4:6,n(i)) = 0;
    elseif b == 9
        A(7:9,7:9,n(i)) = 0;
    end
    
end

end