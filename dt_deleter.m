function A = dt_deleter(A,r,c,n,i)

if i == 0 %row case
    A(r(1),:,n) = zeros(1,size(A,2));
    for j = 1:length(r)
        A(r(j),c(j),n) = 2;
    end
elseif i == 1 %column case
    A(:,c(1),n) = zeros(size(A,1),1);
    for j = 1:length(c)
        A(r(j),c(j),n) = 2;
    end  
end

end