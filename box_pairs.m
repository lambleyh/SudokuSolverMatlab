function [A,t] = box_pairs(A)

A0 = A;

for b = 1:size(A,1)
    B = boxmaker(A,b);
    ct = 1;
    fd = [];
    for R = 1:size(B,1)
        for C = 1:size(B,2)
            if length(find(B(R,C,:) == 2)) == 2
                fd(ct,:) = [find(B(R,C,:) == 2).',R,C];
                ct = ct + 1;
            end
        end
    end
    if size(fd,1) > 1
        for i = 1:size(fd,1) - 1
            val = find(all((fd(:,1:2)-fd(i,1:2)) == 0,2));
            if length(val) == 2
                A = boxempty(b,fd(val(1),1:2),A);
                for j = 1:length(val)
                    [r,c] = box2global(b,fd(val(j),3),fd(val(j),4));
                    A(r,c,fd(val(j),1)) = 2;
                    A(r,c,fd(val(j),2)) = 2;
                end
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