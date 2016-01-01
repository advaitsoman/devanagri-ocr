rootFolder='segmented_images\';
srcFile= dir(strcat(rootFolder,'\*.tiff'));
for j=1:length(srcFile)
   currentFile=strcat(rootFolder,srcFile(j).name);
%currentFile=strcat(rootFolder,currentFile);
%fprintf(id, '%s,' , currentFolder);
img=imread(currentFile);

[h v] =size(img);
if v > h && v - h >= v/6
disp('jodakshara at ');
na=strsplit(srcFile(j).name,'.');
vl=segmentJodakshara(img);
imwrite(img(:,1:vl),'jod.tiff','TIFF');
disp(srcFile(j).name);



end

end