%update matrix of square possibilities, A, for a discover value, n, in
%row, r, and column, c

function A = minitransplant(A,r,c,n)


A(r,c,1:9) = 0; %clear all possible values for square
A(r,1:9,n) = 0; %clear square value in respective row
A(1:9,c,n) = 0; %clear square value in respective column
b = boxfinder(r,c); %determine box from current square
A = boxempty(b,n,A); %clear square value in respective box
A(r,c,n) = 1; %fill in confirmed cell value


end