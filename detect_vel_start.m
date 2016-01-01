function vel=detect_vel_start(input) 
ysh=sum(input,2);
c=size(input);

xsh=sum(input);
erase=0;
vel=1;
for i=1:c(1)
    
   if(abs(ysh(i)-c(2)) <= 4 )
   %   output1(i,:)=0;
    vel=i;
    break;
      erase=1;
   else if(erase==1)
       break;
       end
     
     
   end
   
end