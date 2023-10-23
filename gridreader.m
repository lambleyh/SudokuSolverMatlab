
function [s,R,C] = gridreader(I)

I = rgb2gray(I);
BW = edge(I);

[H,T,R] = hough(BW);
P = houghpeaks(H,20);

PC = P(P(:,2)>85,:);

linesC = houghlines(BW,T,R,PC,'FillGap',5,'MinLength',7);
rhoC = zeros(length(linesC),1);
for k = 1:length(linesC)
    rhoC(k) = linesC(k).rho;
end

C = unique(rhoC);

PR = P(P(:,2)<85,:);

linesR = houghlines(BW,T,R,PR,'FillGap',5,'MinLength',7);
rhoR = zeros(length(linesR),1);
for k = 1:length(linesR)
    rhoR(k) = linesR(k).rho;
end

R = unique(abs(rhoR));

s = zeros(9,9);

for i = 1:length(R)-1
    for j = 1:length(C)-1
        txt = ocr(I,[C(j)+15 R(i)+10 C(j+1)-C(j)-20 R(i+1)-R(i)-20],'CharacterSet','0123456789.','TextLayout','Block');
        words = txt.Text(txt.CharacterConfidences > 0.75);
        s(i,j) = str2double(words);
    end
end

s(isnan(s))=0;

end
