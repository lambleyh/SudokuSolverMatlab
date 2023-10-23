function [A,t] = xw_checker(A)

A0 = A;

for n = 1:size(A,3)
    ct = 1;
    fd = [];
    
    %row case (x-wing in column)
    for r = 1:size(A,1)
        if length(find(A(r,:,n) == 2)) == 2
            fd(ct,:) = [find(A(r,:,n) == 2),r];
            ct = ct + 1;
        end
    end

    for i = 1:size(fd,1)-1
        diff = fd(:,1:2) - fd(i,1:2);
        empt = find(all(diff.' == 0));
        if length(empt) == 2
            newcol = zeros(size(A,2),1);
            newcol(fd(empt(1),3)) = 2;
            newcol(fd(empt(2),3)) = 2;
            A(:,fd(i,1),n) = newcol;
            A(:,fd(i,2),n) = newcol;
            continue
        end
    end
    
    %column case (x-wing in row)
    
    ct = 1;
    fd = [];
    
    for c = 1:size(A,2)
        if length(find(A(:,c,n) == 2)) == 2
            fd(:,ct) = [find(A(:,c,n) == 2);c];
            ct = ct + 1;
        end
    end
    
    for i = 1:size(fd,2)-1
        diff = fd(1:2,:) - fd(1:2,i);
        empt = find(all(diff == 0));
        if length(empt) == 2
            newrow = zeros(1,size(A,2));
            newrow(fd(3,empt(1))) = 2;
            newrow(fd(3,empt(2))) = 2;
            A(fd(1,i),:,n) = newrow;
            A(fd(2,i),:,n) = newrow;
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