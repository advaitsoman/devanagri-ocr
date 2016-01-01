function pos = vartical_line(img)
[a b] = size(img);

s=sum(img);
c=size(s);
avg=0;
count=0;
pos=0;
for i=1:c(2)
    if(a - s(i) <= 10)
        avg=avg+i;
        count=count+1;
    end    
end
avg=avg/count;
if(b - avg <= 10)
  %  disp('vartical line at end');
    pos=2;
end
if( 10 - abs(b/2 - avg) >= 0)
   % disp('vartical line at middle');
    pos=1;
end    
    
