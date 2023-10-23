%scan a row or column, rc, within A and return possible values

%n=0 for row case
%n=1 for column case

function [rc_data] = rc_checker(rc,n,layer,A)
a = 1;
data = 0;
if n == 0
    for count = 1:9
        if A(rc,count,layer) == 2
            data(a) = count;
            a = a+1;
        end
    end
elseif n == 1
    for count = 1:9
        if A(count,rc,layer) == 2
            data(a) = count;
            a = a+1;
        end
    end
end

rc_data = data;
end