function [A,t] = dt_checker(A)

A0 = A;

for b = 1:size(A,1)
        B = boxmaker(A,b);
        for n = 1:9
            [R,C] = find(B(:,:,n) == 2);
            if length(R) > 1
                if any(abs(R-R.')) == 0
                    i = 0; %row denouncer
                    [r,c] = box2global(b,R,C);
                    A = dt_deleter(A,r,c,n,i);
                elseif any(abs(C-C.')) == 0
                    i = 1; %column denouncer
                    [r,c] = box2global(b,R,C);
                    A = dt_deleter(A,r,c,n,i);
                end
            end
        end
end

if A0 == A
    t = 0;
else
    t = 1;
end

end