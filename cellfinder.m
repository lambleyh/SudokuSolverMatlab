%determine cell currently being investigated from i,j coordinates
% defined as 1,2,3;4,5,6;7,8,9
function [c] = cellfinder(i,j)

if i <= 3
    if j <= 3
        c = 1;
    elseif j <= 6
        c = 2;
    else
        c = 3;
    end
elseif i <= 6
    if j <= 3
        c = 4;
    elseif j <= 6
        c = 5;
    else
        c = 6;
    end
else
    if j <= 3
        c = 7;
    elseif j <= 6
        c = 8;
    else
        c = 9;
    end
end