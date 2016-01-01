i=0;
id = fopen('output_shadow.txt','at');
rootFolder='jod_latest\';
%srcFiles = dir('C:\Users\Soman\Desktop\Character recognition\*.tiff');
 % the folder in which ur images exists
 
srcFolder = dir(rootFolder);

for i=3:length(srcFolder)
    %for m=7000:7000+length(srcFolder)
a=strcat(srcFolder(i).name,'\*.tiff');

srcFile= dir(strcat(strcat(rootFolder,srcFolder(i).name),'\*.tiff'));
%disp(length(srcFile));
if(length(srcFile) >= 15)
for j=1:15
    currentFolder=strcat(srcFolder(i).name,'\');
    currentFile=strcat(currentFolder,srcFile(j).name);
    currentFile=strcat(rootFolder,currentFile);
   % fpritf(id, '%s,' , currentFolder);
    img=imread(currentFile);
    f1=vartical_line(img);
    normImf=skelf_correct(img);
    if(i== 5 && j==3)
    imshow(normImf);
    end
    normImf=imresize(normImf,[40,40]); 
    shadow_hv(normImf,currentFolder,f1,'C:\Users\Admin\Documents\jod_train.csv');
    fprintf(id, '\n' );
   %disp(c);
%end
end
end
end