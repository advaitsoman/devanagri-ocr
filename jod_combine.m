function input=jod_combine(input,jodinput)

test=get_image_name('segmented_images\*.tiff');
jodname=get_image_name('segmented_jodakshara\*.tiff');
test
jodname
for i=1:length(jodname)
   for j=1:length(input)
    if(isrelated(jodname{i},test{j}) == 1)
       input(j) = input(j)*100 + jodinput(i);
    end
    end
end
end
function ret=isrelated(a,b)
x=strsplit(char(a),'.');
y=strsplit(char(b),'.');
if(str2double(char(x(1))) == str2double(char(y(1))) && str2double(char(x(2))) == str2double(char(y(2))) && str2double(char(x(3))) == str2double(char(y(3)))) 
ret=1;
else
ret=0;
end
end
