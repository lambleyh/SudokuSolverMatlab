function [A,t] = col_checker(A)

A0 = A;

for c = 1:size(A,1)
    for n = 1:size(A,3)
        
        val = find(A(:,c,n) == 2);
        if length(val) == 1
            A = minitransplant(A,val,c,n);
        end
        
    end
end

if A0 == A
    t = 0;
else
    t = 1;
end

end