%soduku solver version 2
%1 equals definite value
%2 equals uncertain value
%0 means value is not possible

%square refers to an individual unit cell (there are 81 of them)
%box refers to a 3x3 block of squares in which the rules are applied

clear
clc
tic

%easy sudoku
%https://www.theguardian.com/lifeandstyle/2019/mar/25/sudoku-4328-easy
%s = [0,8,0,0,3,0,0,0,2;7,0,0,0,5,0,9,0,0;0,0,9,7,6,2,0,0,8;0,0,0,6,0,0,5,8,0;0,5,0,0,0,0,0,4,0;0,7,4,0,0,3,0,0,0;3,0,0,1,4,6,7,0,0;0,0,7,0,9,0,0,0,3;1,0,0,0,7,0,0,9,0];

%medium sudoku
%https://www.theguardian.com/lifeandstyle/2016/feb/10/sudoku-3354-medium
%s = [0,0,0,0,6,0,0,0,0;9,0,1,0,0,0,4,0,6;4,6,3,0,0,0,5,7,2;5,0,0,6,0,2,0,0,8;0,0,8,0,4,0,2,0,0;3,0,0,7,0,8,0,0,1;2,3,5,0,0,0,7,1,4;7,0,9,0,0,0,8,0,5;0,0,0,0,5,0,0,0,0];

%hard sudoku
%https://www.theguardian.com/lifeandstyle/2019/jan/12/sudoku-4267-hard
%s = [0,1,0,0,0,0,0,0,3;7,5,0,0,0,8,0,1,0;0,0,0,0,0,0,9,8,0;0,0,0,0,6,0,2,4,5;0,0,0,4,0,0,0,0,0;0,8,0,0,0,5,0,3,0;0,0,8,1,0,0,0,0,9;0,9,2,7,0,6,0,0,0;5,0,0,9,0,0,4,0,0];

%hard sudoku 2
%https://www.theguardian.com/lifeandstyle/2021/oct/22/sudoku-5414-hard
%s = [2,6,0,0,0,0,8,0,0;0,0,0,0,0,7,0,0,0;0,5,3,0,0,0,0,0,2;0,0,0,6,7,0,0,9,0;0,7,8,0,0,4,0,0,0;6,0,0,0,0,8,0,0,0;0,1,0,0,4,0,3,0,0;4,0,5,0,8,0,7,0,6;0,3,0,5,0,0,0,0,9];

%expert sudoku
%https://www.theguardian.com/lifeandstyle/2022/jan/08/sudoku-5502-expert
%s = [0,0,0,6,0,0,0,5,0;0,0,0,0,0,0,3,0,4;3,0,0,0,8,0,0,9,0;7,9,0,4,1,0,0,0,0;0,0,0,0,0,2,5,0,0;0,0,4,0,0,7,0,0,1;0,0,8,7,0,0,0,0,0;2,4,0,0,0,5,0,0,0;0,3,0,0,0,6,7,0,0];

I = imread('TestWSGP3.png');
ANS = I;
[s,R,C] = gridreader(I);

s0 = s;
blank = zeros(size(s));
%solving matrix
A(1:9,1:9,1:9) = 2;

count = 0;
A = transplant(s,A);
A0 = A;

while sum(A(:)) > 81 %puzzle is solved when all the values are filled in
    count = count+1;

    [A,t] = row_checker(A);
    if t == 1
        disp('r')
        continue
    end
    
    [A,t] = col_checker(A);
    if t == 1
        disp('c')
        continue
    end
    
    [A,t] = box_checker(A);
    if t == 1
        disp('b')
        continue
    end
    
    [A,t] = ns_checker(A);
    if t == 1
        disp('ns')
        continue
    end
    
    [A,t] = dt_checker(A);
    if t == 1
        disp('dt')
        continue
    end
    
    [A,t] = box_pairs(A);
    if t == 1
        disp('bp')
        continue
    end
    
    [A,t] = box_pairs2(A);
    if t == 1
        disp('bp')
        continue
    end
    
    [A,t] = xw_checker(A);
    if t == 1
        disp('xw')
        continue
    end
    
    [A,t] = rc_pairs(A);
    if t == 1
        disp('rcp')
        continue
    else
        disp('Stuck')
        break
    end
end
s = untransplant(s,A);

disp(s)

for i = 1:size(s,1)
    for j = 1:size(s,2)
        if s0(i,j) == 0
            col = 'magenta';
            siz = (R(2)-R(1))*0.85;
        else
            col = 'blue';
            siz = (R(2)-R(1))*0.25;
        end
        if s(i,j) ~= 0
            ANS = insertText(ANS,[(R(j)+R(j+1))/2 (C(i)+C(i+1))/2], num2str(s(i,j)),'AnchorPoint','center','TextColor',col,'FontSize',round(siz),'BoxOpacity',0);
        else
            ANS = insertText(ANS,[(R(j)+R(j+1))/2 (C(i)+C(i+1))/2], num2str(transpose(find(A(i,j,:)~=0))),'AnchorPoint','center','TextColor',col,'FontSize',round((R(2)-R(1))*0.125),'BoxOpacity',0);
        end
    end
end

imshow(ANS)
toc