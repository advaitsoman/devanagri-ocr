rootFolder='segmented_images\';
srcFile= dir(strcat(rootFolder,'\*.tiff'));
id = fopen('jod_present.csv','w');
for j=1:length(srcFile)
    currentFile=strcat(rootFolder,srcFile(j).name);
%currentFile=strcat(rootFolder,currentFile);
%fprintf(id, '%s,' , currentFolder);
    img=imread(currentFile);
     f1=0;
    [h v] =size(img);
%currentFile
    if(((v*30)/h) > 35)
    vline=RemoveJodakshara(img);
    hp=sum(img);
      if(vline < (2*v/3) && hp(vline) <= max(hp)-5 )
  %        srcFile(j).name=strcat('a.b.',srcFile(j).name);
      fname=strsplit(srcFile(j).name,'.');
      disp(srcFile(j).name);
      jod1 = strcat('segmented_jodakshara\',fname(1),'.',fname(2),'.',fname(3),'.','1');
      jod1=char(jod1);
      imwrite(img(:,1:vline),strcat(jod1,'.tiff'),'TIFF');
      jod2 = strcat('segmented_images\',fname(1),'.',fname(2),'.',fname(3));
       jod2=char(jod2);
        imwrite(img(:,vline:v),strcat(jod2,'.tiff'),'TIFF');
        f1=1;
      end
    end
fprintf(id,'%f,',f1);
end
