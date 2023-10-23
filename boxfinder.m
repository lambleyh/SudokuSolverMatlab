%determine cell currently being investigated from i,j coordinates
% defined as 1,2,3;4,5,6;7,8,9
function [b] = boxfinder(i,j)

if i <= 3
    if j <= 3
        b = 1;
    elseif j <= 6
        b = 2;
    else
        b = 3;
    end
elseif i <= 6
    if j <= 3
        b = 4;
    elseif j <= 6
        b = 5;
    else
        b = 6;
    end
else
    if j <= 3
        b = 7;
    elseif j <= 6
        b = 8;
    else
        b = 9;
    end
end