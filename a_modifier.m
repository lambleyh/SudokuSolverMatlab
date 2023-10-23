%edit A matrix to account for a new value added to s matrix in square (i,j)

function A = a_modifier(A,i,j,value)

A(i,j,1:9) = 0;
A(1:9,j,value) = 0;
A(i,1:9,value) = 0;
c = cellfinder(i,j);
A = cellempty(c,value,A);
A(i,j,value) = 1;

end