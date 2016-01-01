function output= map_jodakshara()

i=0;
output=[];
%%Output File 
disp('IN main');
jodfile=fopen('jod_print.csv','w');
%id = fopen('C:\Users\Palash\Desktop\output_hu.txt','at');
%rootFolder='G:\SEDA\5th Semester\Project 2\char_test_train\char_test_train\core\training_data\';
%%Image folder
rootFolder='segmented_jodakshara\';
%rootFolder='C:\Users\Soman\Desktop\Character recognition\char_test_train\asc\train_features\';
%srcFiles = dir('C:\Users\Soman\Desktop\Character recognition\*.tiff');
 % the folder in which ur images exists
 
%id = fopen('C:\Users\Soman\Desktop\file\tuze_ahe_tuzapashi.csv','w');
id = fopen('C:\Users\Admin\Documents\jod_test.csv','w');
%delete('segmented_images\*.*');%Delete all previous images in segmented_images
for k=1:35
    no=int2str(k);
    P=strcat('P',no);
    if(k <35)
    fprintf(id, '%s,', P);
    end
    if(k==35)
        fprintf(id, '%s', P);
    end
end
 fprintf(id, '\n');
 fclose(id);

srcFile= dir(strcat(rootFolder,'\*.tiff'));
%disp(length(srcFile));
for i=1:length(srcFile)
    for j=1:length(srcFile)-1
     if(word_no(mat2cell(srcFile(j).name)) > word_no(mat2cell(srcFile(j+1).name)))
        temp=srcFile(j);
        srcFile(j)=srcFile(j+1);
        srcFile(j+1)=temp;
     end
    end
end
for j=1:length(srcFile)

currentFile=strcat(rootFolder,srcFile(j).name);
%currentFile=strcat(rootFolder,currentFile);
%fprintf(id, '%s,' , currentFolder);
img=imread(currentFile);
%img=imcomplement(im2bw(img));
%img1=regionprops(img,'FilledImage');
%img2=img1.FilledImage;
%img=imresize(img2,[40,40]);
%f1=vartical_line(imcomplement(im2bw(img)));
f1=vartical_line(img);
%normImf=skelf_correct(img);

min1=100;
min2=100;
max1= -1;
max2= -1;
%test=imcomplement(im2bw(img));
test=img;
%test=imresize(test,[40,40]);
dim=size(test);
for k=1:dim(1)
    for l=1:dim(2)
        if(test(k,l) == 1)
           if(l< min1)
             min1=l; 
           end
           if(l> max1)
             max1=l; 
           end
           if(k< min2)
              min2=k; 
           end
           if(k > max2)
              max2=k; 
           end
        end
    end
end    
%ss=regionprops(imcomplement(im2bw(img)),'BoundingBox');
 %  img=img(round(ss(1).BoundingBox(2)):round(ss(1).BoundingBox(2)) + round(ss(1).BoundingBox(4))-1,round(ss(1).BoundingBox(1)):round(ss(1).BoundingBox(1)) + round(ss(1).BoundingBox(3))-1);    

 %normImf=skelf_correct(img);
    test=test(min2:max2,min1:max1);
    
    %test=removeShirolekha(test);
   dim=size(test);
   min1=100;
min2=100;
max1= -1;
max2= -1;
    for k=1:dim(1)
    for l=1:dim(2)
        if(test(k,l) == 1)
           if(l< min1)
             min1=l; 
           end
           if(l> max1)
             max1=l; 
           end
           if(k< min2)
              min2=k; 
           end
           if(k > max2)
              max2=k; 
           end
        end
    end
    end    
   test=test(min2:max2,min1:max1);
  
 normImf=skelf_correct(test);
  %normImf=imresize(normImf,[40,40]); 
  %shadow_hv(normImf,srcFile(j).name,f1);
  shadow_hv(normImf,int2str(j),f1,'C:\Users\Admin\Documents\jod_test.csv');
  disp(currentFile);



end

  system('R CMD BATCH C:\Users\Admin\Documents\finalSVM_Jodakshara.R  C:\Users\Admin\Documents\op1234.txt');
disp('start jodakshara')
%ROut = csvread('C:\Users\HP\Documents\op.csv');
ROut = csvread('C:\Users\Admin\Documents\op_jod.csv');

%fileID1 = fopen('C:\Users\HP\Documents\ukar_data.csv');






train = csvread('C:\Users\Admin\Documents\trainJodakshara.csv');


test=get_image_name('segmented_jodakshara\');
%disp('test')
%test{1}
%disp('ukar')
%ukar{1}
test
stest=length(test);
m=1;
for j = 3:length(test)
    for i = 1:34
        if ROut(i,j-2) ~= 0
            output(m) = train(i);
            fprintf(jodfile,'%d\n',train(i));
            m = m+1;
        end
    end
end


end