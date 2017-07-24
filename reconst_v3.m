clc;
clear;

% READ IMAGE FROM DESKTOP

[fname,path,~] = uigetfile('.jpg');
[~,filename,~] = fileparts(fname);
A = imread(fname);

% GET SIZE OF IMAGE ROW,COL,DIMENSION
[r,c,d] = size(A);


% NOW BISECT THE IMAGE TO CREATE FACE SYMMETRY

figure(4),imshow(A),title('ORIGINAL');
 [mid_x,mid_y] = getpts;
 mid_x = round(mid_x);
 impixelinfo;

 
 
 if (d==1)
    left = A(1:r,1:mid_x);
    right = A(1:r,mid_x+1:end);
    original = cat(2,left,right);
    left = cat(2,left,left(:,end:-1:1));
    right = cat(2,right(:,end:-1:1),right);
 else
    left = A(1:r,1:mid_x,1:3);
    right = A(1:r,mid_x+1:end,1:3);
    original = cat(2,left,right);
    left = cat(2,left,left(:,end:-1:1,:));
    right = cat(2,right(:,end:-1:1,:),right);
     
 end



figure(5),imshow(left),title('LEFT');
figure(6),imshow(right),title('RIGHT');

impixelinfo;

folder = [filename '/'];          
 
[~,mess,~] = mkdir(folder);

imwrite(A,[folder filename '.jpg']);
imwrite(left,[folder filename '_left' '.jpg']);
imwrite(right,[folder filename '_right' '.jpg']);