function output1=removeShirolekha(input)
%inp1=regionprops(input,'FilledImage');
%input=inp1.FilledImage;
ysh=sum(input,2);
c=size(input);
output1=input;
xsh=sum(input);
erase=0;
for i=1:c(1)
    
   if(abs(ysh(i)-c(2)) <= 4 )
      output1(i,:)=0;
       erase=1;
   else if(erase==1)
       break;
       end
     
     
   end
   
end

%for i=1:c(2)
 %  if(xsh(i) < 5 
  %     output(1:20,i)=0; 
               
  % end
%end
