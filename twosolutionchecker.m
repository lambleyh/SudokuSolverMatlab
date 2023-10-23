clear
clc

load('s.mat')

A(1:9,1:9,1:9) = 2;
A = transplant(s,A);

for i = 1:9
    for j = 1:9
        temp2 = A - A(i,j,:);
        v = 1;
        compmatrix = [0,0];
        for k = 1:9
            for l = 1:9
                if temp2(k,l,:) == temp2(i,j,:)
                    compmatrix(v,:) = [k,l];
                    v = v+1;
                end
            end
        end
        if size(compmatrix) == [2,2]
            if compmatrix(1,1) == compmatrix(2,1) %row case
                
            elseif compmatrix(1,2) == compmatrix(2,2) %column case
                holder = A(i,j,:);
                A(:,compmatrix(1,2),:) = A(:,compmatrix(1,2),:)-A(i,j,:);
                A(compmatrix(1,1),compmatrix(1,2),:) = holder;
                A(compmatrix(2,1),compmatrix(2,2),:) = holder;
            end
        end
    end
end

for i = 1:9
    for j = 1:9
        for k = 1:9
            if A(i,j,k) < 0
                A(i,j,k) = 0;
            end
        end
    end
end