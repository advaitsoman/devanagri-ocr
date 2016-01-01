function img=get_image_name(file)
a=dir(file);
img=[];
for i=1:length(a)
img=[img cellstr(a(i).name)];
%use char(img(1)) to get string in var
%opfileID1 = fopen('images_name.csv');
%img=textscan(opfileID1,'%s', 'delimiter',',');
end
for i=1:length(img)
    for j=1:length(img)-1
    if(word_no(img{j}) > word_no(img{j+1}))
        temp=img{j};
        img{j}=img{j+1};
        img{j+1}=temp;
    end
    end
end
