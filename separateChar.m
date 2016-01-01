function output=separateChar(input)
%inp1=regionprops(input,'FilledImage');
%inp=img1.FilledImage;

c=size(input);
output=input;
xsh=sum(input);
ysh=sum(input,2); 
sl=max(ysh);
%disp(min(xsh));
minimum=1000;
for k=1:length(xsh)
    if(xsh(k) <= minimum && xsh(k) > 2)
       minimum = xsh(k);
    end
end

for i=1:c(2)
  
    
   if(xsh(i) <= minimum   )
       
       for j=1:c(1)
          flag=0;         
           if(output(j,i)==1 && ysh(j) > sl-20 && flag == 0  )
               flag=1;
               output(j,i)=0;
              
           else if(output(j,i)==0 && flag==1)
                break;
               end
           end
       end
    end
               
   
end
