function [A,t] = box_pairs2(A)

A0 = A;

for b = 1:size(A,1)
    B = boxmaker(A,b);
    ct = 1;
    fd = [];
    
    for n = 1:size(A,3)
        if length(find(B(:,:,n) == 2)) == 2
            fd(ct,:) = [find(B(:,:,n) == 2).',n];
            ct = ct + 1;
        end
    end
    
    idx = [1,4,7;2,5,8;3,6,9];
    
    if size(fd,1) > 1
        for i = 1:size(fd,1) - 1
            val = find(all((fd(:,1:2)-fd(i,1:2)) == 0,2));
            if length(val) == 2
                A = boxempty(b,fd(val,3),A);
                for j = 1:length(val)
                    for R = 1:size(B,1)
                        for C = 1:size(B,2)
                            if idx(R,C) == fd(val(1),j)
                                [r,c] = box2global(b,R,C);
                                A(r,c,:) = zeros(1,size(A,3));
                                A(r,c,fd(val(1),3)) = 2;
                                A(r,c,fd(val(2),3)) = 2;
                            end
                        end
                    end
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