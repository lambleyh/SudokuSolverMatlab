%box coordinates to global
function [r,c] = box2global(b,R,C)

z = [0,0;0,1;0,2;1,0;1,1;1,2;2,0;2,1;2,2];

r = R + 3*z(b,1);
c = C + 3*z(b,2);

end