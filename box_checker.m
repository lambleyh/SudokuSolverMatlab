function [A,t] = box_checker(A)

A0 = A;

for b = 1:size(A,1)
        B = boxmaker(A,b);
        for n = 1:9
            [R,C] = find(B(:,:,n) == 2);
            if length(R) == 1
                [r,c] = box2global(b,R,C);
                A = minitransplant(A,r,c,n);
            end
        end
end

if A0 == A
    t = 0;
else
    t = 1;
end

end