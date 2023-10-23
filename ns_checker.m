function [A,t] = ns_checker(A)

A0 = A;

for r = 1:size(A,1)
    for c = 1:size(A,2)
        
        val = find(A(r,c,:) == 2);
        if length(val) == 1
            A = minitransplant(A,r,c,val);
        end
        
    end
end

if A0 == A
    t = 0;
else
    t = 1;
end

end