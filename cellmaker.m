%isolate cells from A matrix for further analysis
function C = cellmaker(A,c)

z = [1:3,1:3;1:3,4:6;1:3,7:9;4:6,1:3;4:6,4:6;4:6,7:9;7:9,1:3;7:9,4:6;7:9,7:9];

C = A(z(c,1:3),z(c,4:6),:);


end