%soduku solver version 1
%1 equals definite value
%2 equals uncertain value
%0 means value is not possible

%square refers to an individual unit cell (there are 81 of them)
%cell refers to a 3x3 block of squares in which the rules are applied

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
s = [0,1,0,0,0,0,0,0,3;7,5,0,0,0,8,0,1,0;0,0,0,0,0,0,9,8,0;0,0,0,0,6,0,2,4,5;0,0,0,4,0,0,0,0,0;0,8,0,0,0,5,0,3,0;0,0,8,1,0,0,0,0,9;0,9,2,7,0,6,0,0,0;5,0,0,9,0,0,4,0,0];

%load('intmatrix.mat')

s0 = s;
blank = zeros(size(s));
%solving matrix
A(1:9,1:9,1:9) = 2;

count = 1;

%% Transplant values into solving matrix
A = transplant(s,A);

while sum(s(:)) < 45*9 %puzzle is solved when all the values are filled in  
    %% Check single possibilities for rows and columns
    for n = 0:1
        for rc = 1:9
            for layer = 1:9
                rc_data = rc_checker(rc,n,layer,A);
                if length(rc_data) == 1
                    if rc_data ~= 0
                        if n == 0
                            s(rc,rc_data) = layer;
                            A = a_modifier(A,rc,rc_data,layer);
                        elseif n == 1
                            s(rc_data,rc) = layer;
                            A = a_modifier(A,rc_data,rc,layer);
                        end
                    end
                end
            end
        end
    end
    
    %% Check single possibilities for cells
    for c = 1:9
        C = cellmaker(A,c);
        for d = 1:9
            h = find(C(:,:,d)>1);
            if length(h) == 1
                for a = 1:3
                    for b = 1:3
                        if C(a,b,d) == 2
                            [I,J] = cell2global(c,a,b);
                            s(I,J) = d;
                            A = a_modifier(A,I,J,d);
                        end
                    end
                end
            end
        end
    end
    
    %% Check single possibilities for individual squares
    for i = 1:9
        for j = 1:9
            square = 0;
            n1 = 1;
            for k = 1:9
                if A(i,j,k) == 2
                    square(n1) = k;
                    n1 = n1 + 1;
                end
            end
            if length(square) == 1
                if square ~= 0
                    s(i,j) = square;
                    A = a_modifier(A,i,j,square);
                end
            end
        end
    end
    
    %% check double possibilities
%     check = 0;
%     for i = 1:9
%         for j = 1:9
%             temp2 = A - A(i,j,:);
%             v = 1;
%             compmatrix = [0,0];
%             for k = 1:9
%                 for l = 1:9
%                     if temp2(k,l,:) == temp2(i,j,:)
%                         compmatrix(v,:) = [k,l];
%                         v = v+1;                        
%                     end
%                 end
%             end
%             if size(compmatrix) == [2,2]
%                 check = 1;
%                 if compmatrix(1,1) == compmatrix(2,1) %row case
%                      holder = A(i,j,:);
%                      A(compmatrix(1,1),:,:) = A(compmatrix(1,1),:,:)-A(i,j,:);
%                      A(compmatrix(1,1),compmatrix(1,2),:) = holder;
%                      A(compmatrix(2,1),compmatrix(2,2),:) = holder;
%                 elseif compmatrix(1,2) == compmatrix(2,2) %column case
%                     holder = A(i,j,:);
%                     A(:,compmatrix(1,2),:) = A(:,compmatrix(1,2),:)-A(i,j,:);
%                     A(compmatrix(1,1),compmatrix(1,2),:) = holder;
%                     A(compmatrix(2,1),compmatrix(2,2),:) = holder;
%                 end
%                 %% non-negativity constraint
%                 for i = 1:9
%                     for j = 1:9
%                         for k = 1:9
%                             if A(i,j,k) < 0
%                                 A(i,j,k) = 0;
%                             end
%                         end
%                     end
%                 end
%             end
%             if check == 1
%                 break
%             end
%         end
%         if check == 1
%             break
%         end
%     end

    %% check for code fail
    
    diff = s-s0;
    if diff == blank
        disp('Stuck!')
        break
    end
    
    s0 = s;
    count = count+1;
    
end
disp(s)
toc