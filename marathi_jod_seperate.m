function c1 = marathi_jod_seperate(input1)

%BW=bwlabel(input1);
input1 = imcomplement(im2bw(input1));
c=regionprops(input1,'BoundingBox','Image');
c1=regionprops(input1,'BoundingBox','Image');
n=length(c);

for i=1:n
    
    for j=1:(n-1)
        if(c1(j).BoundingBox(2) > c1(j+1).BoundingBox(2))
            
                temp=c1(j);
                c1(j)=c1(j+1);
                c1(j+1)=temp;
            
        end
    end
end
    
for i=1:n
    
    for j=1:(n-1)
        
        x=(abs(c1(j).BoundingBox(2)-c1(j+1).BoundingBox(2)));
                
         

        if(c1(j).BoundingBox(2)==c1(j+1).BoundingBox(2)||x<20)
         if(c1(j).BoundingBox(1)>c1(j+1).BoundingBox(1))
            
                temp=c1(j);
                c1(j)=c1(j+1);
                c1(j+1)=temp;
            
         end
        end
        
     
            
        

      
    end   
end


for i = 1:length(c)
   imwrite(~c1(i).Image,strcat('jod_data\',int2str(i),'.tiff'),'TIFF');
    display(c1(i).BoundingBox);
end
end