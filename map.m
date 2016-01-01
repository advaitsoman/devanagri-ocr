function [ output ] = map()

  system('R CMD BATCH C:\Users\Admin\Documents\finalSVM.R  C:\Users\Admin\Documents\op1234.txt');
disp('start')
%ROut = csvread('C:\Users\HP\Documents\op.csv');
ROut = csvread('C:\Users\Admin\Documents\op.csv');

%fileID1 = fopen('C:\Users\HP\Documents\ukar_data.csv');
fileID1 = fopen('ukar_data.csv');
ukar=textscan(fileID1,'%s', 'delimiter',',');


fid = fopen('Output\output.txt', 'w');
fileID2 = fopen('vel_data.csv');
velMatra=textscan(fileID2,'%s', 'delimiter',',');

train = csvread('C:\Users\Admin\Documents\trainLabels.csv');


test=get_image_name('segmented_images\*.tiff');
%disp('test')
%test{1}
%disp('ukar')
%ukar{1}
stest=length(test);


counter=csvread('charactor_and_count.csv');
counter

scounter=length(counter);
scounter
name=1;
test_traverse=1;
m=1;
for j = 1:stest
    for i = 1:46
        if ROut(i,j) ~= 0
            output(m) = train(i);         
            m = m+1;
        end
    end
end
for j=1:m-1
   if(output(j) == 2358)
   output(j) = ocr(imread(strcat('segmented_images\',char(test{j}))));
 %  imshow(imread(strcat('segmented_images\',char(test{j}))));
  %disp(strcat('segmented_images\',char(test{j})));
   end
end
jodoutput=map_jodakshara();
output=jod_combine(output,jodoutput);
cnt=1;
prv=0;
for i=1:scounter
    flag=0;
    if(cnt > length(output))
       break; 
    end
    if(name < word_no(test{cnt}))
       send(' ');
       name = word_no(test{cnt});
    end
    if(mod(name,8) == 0 && prv ~= name)
        send(10);
        prv=name;
    end
    test_traverse = test_traverse+1;
    if(counter(i)==1)
        
        if(output(cnt) == 2327)
            send('g')
        else
            if(output(cnt) == 2339)
                send('N')
            else
                if(output(cnt) == 2358)
                    send('S')
                else
                    if(output(cnt) == 2366)
                        send('a')
                    else
                         if(output(cnt) == 985407)
                            send('a');
                            send('a');
                            send('o');                        
                         else
                            send(output(cnt))
                         end
                    end
                end
            end
        end
       
        cnt=cnt+1;
    end
    if(counter(i)==2)
        if(output(cnt)==2366 && output(cnt+1)==2366)
            send('a')
            cnt=cnt+2;
            disp('ga aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
            continue;
        end    
        if(output(cnt)~=2375 ||output(cnt)~=2369 ||output(cnt)~=2370 ||output(cnt)~=2366 )%ukar            
            send(output(cnt))
            cnt=cnt+1;
            flag=0;
            if(output(cnt)==2339)
                ukarl=length(ukar);
                for x=1:ukarl
                    %if(ukar(x)==test(cnt))
                    if(strmatch(char(ukar{x}),char(test{cnt})))    
                        send(2369)
                        flag=1;
                        %cnt=cnt+1;
                        break
                    end                    
                end
            end
            if(output(cnt)==2375)
                ukarl=length(ukar);
                for x=1:ukarl
                    if(strmatch(char(ukar{x}),char(test{cnt})))
                        send(2370)
                        flag=1;
                        %cnt=cnt+1;
                        break
                    end                    
                end
            end
            if(flag~=1)
                send(output(cnt))           
              %  cnt=cnt+1  
            end
            cnt=cnt+1;
        else
            if(output(cnt)==2366)
                if(output(cnt+1)==2375)
                    ukarl=length(ukar);
                    for x=1:ukarl
                        if(strmatch(char(ukar{x}),char(test{cnt+1})))
                            send(2370)
                            flag=1;
                            %cnt=cnt+1;
                            break
                        end 
                    end
                    if(flag~=1)
                        send(2379)
                    end
                end
                if(output(cnt+1)==2369)
                    send(2369)
                end
                if(output(cnt+1)==2370)
                    send(2370)
                end
                 if(output(cnt+1)==2339)
                    ukarl=length(ukar);
                    for x=1:ukarl
                        if(strmatch(char(ukar{x}),char(test{cnt+1})))
                            send(2369)
                            %cnt=cnt+1;
                            break
                        end                    
                    end
                 end
            end
            if(output(cnt)~=2366)
                if(output(cnt)==2369)
                    send(2369)
                end
                if(output(cnt)==2370)
                    send(2370)
                end
                if(output(cnt)==2375)
                       ukarl=length(ukar);
                    for x=1:ukarl
                        if(strmatch(char(ukar{x}),char(test{cnt+1})))
                            send(2370)
                            flag=1;
                            %cnt=cnt+1;
                            break
                        end 
                    end
                    if(flag~=1)              
                        if(output(cnt+1)==2366)
                            send(2379)
                        end
                    end
                end
                
                   if(output(cnt)==2339)
                       ukarl=length(ukar);
                    for x=1:ukarl
                        if(strmatch(char(ukar{x}),char(test{cnt})))
                            flag=1;
                            %cnt=cnt+1;
                            break
                        end 
                    end
                    if(flag==1)               
                        if(output(cnt+1)==2366)
                        send(2369)
                        end
                    end
                   end
                   cnt=cnt+2;
            end
        end
    end
    if(counter(i)==3)
       % for z=1:3
        %   if(output(cnt)==2339 || output(cnt)==2327 ||output(cnt)==2358)
         %      send(output(cnt))
          %     send(2367) % unicode changed
           %end
           
           %cnt=cnt+4;       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       %end
        if(output(cnt)~=985407  && output(cnt)~=2368 && output(cnt)~=2366 )    % unicode changed  -- this is getting printed in notepad.
            send(output(cnt))
            if(output(cnt+1) == 985407 || output(cnt+2) == 985407) 
            send(2368) % unicode changed
            elseif((output(cnt+1) == 2370 || output(cnt+2) == 2370))
            send('a');
            send('o');
            end    
            cnt=cnt+3;
           
        elseif(output(cnt+2)~=985407 && output(cnt+2)~=2368 && output(cnt+2)~=2366 ) % unicode changed
            if(output(cnt+2)==2327 ||output(cnt+2)==2339 || output(cnt+2)==2358)
              send('i')
              if(output(cnt+2)==2327)
                  send('g')
              elseif(output(cnt+2)==2339)
                  send('N')
              elseif(output(cnt+2)==2358)
                  send('S')
              end
            else
            send(output(cnt+2))
            send(2367) % unicode changed            
            end
            cnt=cnt+3;
        else
            
            send('a');
            send('I');
            %send(2368) % unicode changed
            cnt = cnt + 3;   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
   % if(counter(i)==4)
    %   for z=1:4
     %      if(output(cnt)==2339 || output(cnt)==2327 ||output(cnt)==2358)
      %         send(output(cnt))
       %        send(2367) % unicode changed
        %   end
         %  cnt=cnt+4;       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %end
    %end
end
output
end

