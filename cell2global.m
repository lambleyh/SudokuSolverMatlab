%cell coordinates to global
function [I,J] = cell2global(c,a,b)

z = [0,0;0,1;0,2;1,0;1,1;1,2;2,0;2,1;2,2];

I = a + 3*z(c,1);
J = b + 3*z(c,2);

end