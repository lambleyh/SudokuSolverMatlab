function [A,t] = rc_pairs(A)

A0 = A;

%row case

for r = 1:size(A,1)
    ct = 1;
    fd = [];
    
    
    for c = 1:size(A,2)
        if length(find(A(r,c,:) == 2)) == 2
            fd(:,ct) = [find(A(r,c,:) == 2);c];
            ct = ct + 1;
        end
    end

    for i = 1:size(fd,2)-1
        diff = fd(1:2,:) - fd(1:2,i);
        empt = find(all(diff == 0));
        if length(empt) == 2
            newval = zeros(1,size(A,1));
            newval(fd(3,empt(1))) = 2;
            newval(fd(3,empt(2))) = 2;
            A(r,:,fd(1,i)) = newval;
            A(r,:,fd(2,i)) = newval;
            continue
        end
    end
end

%column case

for c = 1:size(A,2)
    ct = 1;
    fd = [];
    
    
    for r = 1:size(A,1)
        if length(find(A(r,c,:) == 2)) == 2
            fd(:,ct) = [find(A(r,c,:) == 2);r];
            ct = ct + 1;
        end
    end

    for i = 1:size(fd,2)-1
        diff = fd(1:2,:) - fd(1:2,i);
        empt = find(all(diff == 0));
        if length(empt) == 2
            newval = zeros(1,size(A,1));
            newval(fd(3,empt(1))) = 2;
            newval(fd(3,empt(2))) = 2;
            A(:,c,fd(1,i)) = newval;
            A(:,c,fd(2,i)) = newval;
            continue
        end
    end
end

if A0 == A
    t = 0;
else
    t = 1;
end

end