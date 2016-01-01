function send(input1)
temp=input1;
if(temp >3000)
    input1(1)=convert_num(mod(temp,100));
    input1(2)=(int16(temp/100));
end
i=1;
for i=1:length(input1)
    if (i > length(input1))
      break;
    end
    if(input1(i) == 2327)
          %  send('g')
         input1='g';
          
 end
 if(input1(i) == 2339)
     input1='N';
 end
 
 if(input1(i) == 2358)
     input1='S';
 end
fid = fopen('Output\output.txt', 'at');
%fwrite(fid, unicode2native(char(hex2dec(input1)),'UTF-8'),'uint8');
fwrite(fid, unicode2native(char(input1(i)),'UTF-8'),'uint8');

%if isempty(current)
%current=1;
%end
%if isempty(a)
%a=1;
%else
 %   a=a+1;
    
  %  current;
   % if(space(current) == a)
   % fwrite(fid, unicode2native(char(0032),'UTF-8'),'uint8');
    
   % a=0;
   % current=current+1;
   % if(current == length(space)+1)
    %    current=1;
    %    a=0;
   % end
   % end
%end

fclose(fid);
end
end