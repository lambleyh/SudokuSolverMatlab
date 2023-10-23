%write matrix of square possibilities, A, from main puzzle, s

function A = transplant(s,A)

for i = 1:size(s,1) %rows
    for j = 1:size(s,2) %columns
        temp = s(i,j); %holds value of square in s
        if temp ~= 0 %if the square is filled
            A(i,j,:) = 0; %clear all possible values for square
            A(:,j,temp) = 0; %clear square value in respective column
            A(i,:,temp) = 0; %clear square value in respective row
            c = boxfinder(i,j); %determine box from current square
            A = boxempty(c,temp,A); %clear square value in respective box
            A(i,j,temp) = 1; %fill in confirmed cell value
        end
    end
end


end