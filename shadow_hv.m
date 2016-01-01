function [] = shadow_hv(img,currentFolder,f1,file)

%id = fopen('C:\Users\Admin\Documents\test.csv','at');
id = fopen(file,'at');
%img=imresize(img,[40,40]);
%carry=mat2cell(img,[10,10,10,10],[10,10,10,10]);


[r,c] = size(img);  %

rpart1 = idivide(r,int16(4),'floor');   %
temp = r - 4*rpart1;   %
rpart2 = rpart1 + temp;   %

cpart1 = idivide(c,int16(4),'floor');  %
temp = c - 4*cpart1    ;%
cpart2 = cpart1 + temp ;   %

carry=mat2cell(img,[rpart1,rpart1,rpart1,rpart2],[cpart1,cpart1,cpart1,cpart2]);   %

fprintf(id,'%s,' , currentFolder);   

fprintf(id,'%f,',f1);
en=bweuler(img);
fprintf(id,'%f,',en);
for j=1:16
    img=cell2mat(carry(j));
xsh= sum(img);
ysh=sum(img,2);

[row,col] = size(img);  %

for i=1:col%
    if(xsh(i) > 1)
        xsh(i)=1;
    end    
end
for i=1:row% 
    if(ysh(i,1) > 1)
        ysh(i,1)=1;
    end    
end
ysh1=sum(ysh);
xsh1=sum(xsh,2);
% Each individual part assumed to be 10x10.
xsh1 = (10/col * xsh1);%
remainder = rem(xsh1*10,10);%
if( remainder < 5);%
    xsh1 = floor(xsh1);%
else%
    xsh1 = ceil(xsh1);%
end%



ysh1 = (10/row * ysh1);%
remainder = rem(ysh1*10,10);%
if(remainder < 5)%
    ysh1 = floor(ysh1);%
else%
    ysh1 = ceil(ysh1);%
end%

fprintf(id, '%f,' , xsh1);
if(j == 16)
    fprintf(id, '%f\n', ysh1);
else
fprintf(id, '%f,', ysh1);
end


end
fclose(id);