%write puzzle output, s, from matrix of square possibilities, A

function s = untransplant(s,A)

for i = 1:size(A,1) %rows
    for j = 1:size(A,2) %columns
        if isempty(find(A(i,j,:) == 1, 1)) == 0
            s(i,j) = find(A(i,j,:) == 1);
        else
            s(i,j) = 0;
        end
    end
end


end