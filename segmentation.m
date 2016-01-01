function   segmentation(inp,ss4)


inp=imcomplement(im2bw(inp));
inp = bwareaopen(inp,50);%Removes small pixel areas
%imshow(inp);
ss=regionprops(inp,'BoundingBox');
ss=ss4;
delete('segmented_images\*.*');
delete('segmented_jodakshara\*.*');
delete('ukar_data.csv');
id = fopen('ukar_data.csv','w');
id1 = fopen('vel_data.csv','w');
id2=fopen('charactor_and_count.csv','w');
id3=fopen('space_pos.csv','w');
id4=fopen('images_name.csv','w');
%imshow(inp);
label=[];
ukar_flag=0;
vel_flag=0;
name_flag=0;
for i=1:length(ss)
    
    inp1=inp(round(ss(i).BoundingBox(2)):round(ss(i).BoundingBox(2)) + round(ss(i).BoundingBox(4))-1,round(ss(i).BoundingBox(1)):round(ss(i).BoundingBox(1)) + round(ss(i).BoundingBox(3))-1);
    word_count=0;
    %imshow(inp);
    % s=sum(inp,2);
    % dim=size(inp1);
   %  m=min(s);
    % for l=round(dim(1)/2)+10:round(dim(1))
     %   if(s(l) <=m+2)
      %     inp1(l,:)=0;
       %    break;
       % end
        
    % end
    %out=removeShirolekha(inp1);
    ukar=seperate(inp1);
    h1=round(ss(i).BoundingBox(2));
    out=separateChar(inp1);
    vel=detect_vel_start(inp1);
   ss1=regionprops(out,'BoundingBox');
    dim=size(out);
    %disp(dim(1));
      if( dim(1)-round(ukar)  > 7)
      out(round(ukar)-2,:)=0;
     disp('ukar');
      disp(ukar);    
    
      end
    %out(round(ukar)-2,:)=0;
    %if(i==1)
        %end;
    disp(ukar);
    out = bwareaopen(out,20);
    no1=int2str(i);
    no1=strcat(no1,'.');
    
  for j=1:length(ss1)
     %   disp(ss1(j));
      %  disp(size(out));
      % out=separateChar(inp1);
       
        no=int2str(j);
         no=strcat(no1,no);
     count=0;   
     %imshow(ss1(j).FilledImage);
     dim=size(out);
     
     if(round(ss1(j).BoundingBox(2)) == dim(1))
     ss1(j).BoundingBox(2)=round(ss1(j).BoundingBox(2))-1;
     end
      if(round(ss1(j).BoundingBox(4)) == dim(1))
     ss1(j).BoundingBox(4)=round(ss1(j).BoundingBox(4))-1;
      end
      if(round(ss1(j).BoundingBox(1)) == dim(2))
     ss1(j).BoundingBox(1)=round(ss1(j).BoundingBox(1))-1;
      end
      if(round(ss1(j).BoundingBox(3)) == dim(2))
     ss1(j).BoundingBox(3)=round(ss1(j).BoundingBox(3))-1;
      end
    h2=round(ss1(j).BoundingBox(2)); 
     a=out(round(ss1(j).BoundingBox(2)):round(ss1(j).BoundingBox(2)) + round(ss1(j).BoundingBox(4))-1,round(ss1(j).BoundingBox(1)):round(ss1(j).BoundingBox(1)) + round(ss1(j).BoundingBox(3)-1));
     dim=size(a);
     dim1=dim(1)*dim(2);
     
         if(abs(dim(1)/dim(2)) <= 2.5)
               a=removeShirolekha(a);
         end
           path1=strcat('temp\',no);
      imwrite(a,strcat(path1,'.tiff'),'TIFF');
      if(dim1 >= 0)
      ss2=regionprops(a,'BoundingBox');
       no=strcat(no,'.');
         for k=1:length(ss2)
         a1=a(round(ss2(k).BoundingBox(2)):round(ss2(k).BoundingBox(2)) + round(ss2(k).BoundingBox(4))-1,round(ss2(k).BoundingBox(1)):round(ss2(k).BoundingBox(1)) + round(ss2(k).BoundingBox(3)-1));
         h3=round(ss2(k).BoundingBox(2));
         no2=strcat(no,strcat(int2str(k),'.tiff'));
         path=strcat('segmented_images\',no2);
         dim_let=size(a1);
         dim_let1=dim_let(1)*dim_let(2);
        
         if(dim_let1 >= 30)
         if( h2+ h3 -2 <= vel)
            disp('vel at : -');
            disp(no2);
            if(vel_flag == 0)
                fprintf(id1,',%s',no2);
                vel_flag=1;
            else
            fprintf(id1,'%s',no2);
            
            end
        end
         if( h2+ h3 +2 >= ukar)
            disp('ukar at : -');
            disp(no2);
            if(ukar_flag == 0)
                fprintf(id,'%s',no2);
                ukar_flag=1;
            else
            fprintf(id,',%s',no2);
            
            end
        end
     imwrite(a1,path,'TIFF');
     if(name_flag == 0)
                fprintf(id4,'%s',no2);
                name_flag=1;
            else
            fprintf(id4,'/n%s',no2);
     end      
     count=count+1;
     word_count=word_count+1;
         end
         end
        
    disp('Char and count ')
    disp(no);
    disp(count);
%    fprintf(id2,'%s,',no);
    fprintf(id2,'%d\n',count);
     end
       end
     fprintf(id3,'%d\n',word_count);
 
end
fclose('all');