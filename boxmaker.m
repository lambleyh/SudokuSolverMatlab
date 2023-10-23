%isolate cells from A matrix for further analysis
function B = boxmaker(A,b)

z = [1:3,1:3;1:3,4:6;1:3,7:9;4:6,1:3;4:6,4:6;4:6,7:9;7:9,1:3;7:9,4:6;7:9,7:9];

B = A(z(b,1:3),z(b,4:6),:);


end