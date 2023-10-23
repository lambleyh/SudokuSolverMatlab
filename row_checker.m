function [A,t] = row_checker(A)

A0 = A;

for r = 1:size(A,1)
    for n = 1:size(A,3)
        
        val = find(A(r,:,n) == 2);
        if length(val) == 1
            A = minitransplant(A,r,val,n);
        end
        
    end
end

if A0 == A
    t = 0;
else
    t = 1;
end

end