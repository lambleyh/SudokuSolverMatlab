clear
clc
close all

I = imread('TestWSGP3.png');

I = rgb2gray(I);
BW = edge(I);

[H,T,R] = hough(BW);
P = houghpeaks(H,20);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');

PC = P(P(:,2)>85,:);

lines = houghlines(BW,T,R,PC,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
len = [];
rho = [];
for k = 1:length(lines)
    len(k) = norm(lines(k).point1 - lines(k).point2);
    rho(k) = lines(k).rho;
    if len(k) > 0.25*mean(size(I))
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    end
end

C = unique(rho);

PR = P(P(:,2)<85,:);

lines = houghlines(BW,T,R,PR,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
len = [];
rho = [];
for k = 1:length(lines)
    len(k) = norm(lines(k).point1 - lines(k).point2);
    rho(k) = lines(k).rho;
    if len(k) > 0.25*mean(size(I))
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    end
end

R = unique(abs(rho));

A = zeros(9,9);

for i = 1:length(R)-1
    for j = 1:length(C)-1
        txt = ocr(I,[C(j)+15 R(i)+10 C(j+1)-C(j)-20 R(i+1)-R(i)-20],'CharacterSet','0123456789.','TextLayout','Block');
        words = txt.Text(txt.CharacterConfidences > 0.75);
        A(i,j) = str2double(words);
    end
end

figure(4)
Icrop = imcrop(I,[C(j)+15 R(i)+10 C(j+1)-C(j)-20 R(i+1)-R(i)-20]);
imshow(Icrop)

A(isnan(A))=0;