function [ output ] = map_revised()

system('R CMD BATCH finalSVM.R');
disp('start')
ROut = csvread('C:\Users\HP\Documents\op.csv');

fileID1 = fopen('C:\Users\HP\Documents\ukar_data.csv');
ukar=textscan(fileID1,'%s', 'delimiter',',');

fileID2 = fopen('C:\Users\HP\Documents\vel_data.csv');
velMatra=textscan(fileID2,'%s', 'delimiter',',');

train = csvread('C:\Users\HP\Documents\trainLabels.csv');


test=get_image_name();
test

stest=length(test);
stest

counter=csvread('C:\Users\HP\Documents\charactor_and_count.csv');
counter

scounter=length(counter);
scounter

m=1;
for j = 1:stest
    for i = 1:46
        if ROut(i,j) ~= 0
            output(m) = train(i);         
            m = m+1;
        end
    end
end

cnt=1;
for i=1:scounter
    flag=0;
    if(counter(i)==1)
        send(output(cnt))
        cnt=cnt+1;
    end
    if(counter(i)==2)
        if(output(cnt)~=2375 ||output(cnt)~=2369 ||output(cnt)~=2370 ||output(cnt)~=2366 )%ukar            
            send(output(cnt))
            cnt=cnt+1;
            flag=0;
            if(output(cnt)==2339)
                ukarl=length(ukar);
                for x=1:ukarl
                    if(ukar(x)==test(cnt))
                        send(2369)
                        break
                    end                    
                end
            end
            if(output(cnt)==2375)
                ukarl=length(ukar);
                for x=1:ukarl
                    if(ukar(x)==test(cnt))
                        send(2370)
                        flag=1;
                        break
                    end                    
                end
            end
            if(flag~=1)
                send(output(cnt))           
                cnt=cnt+1  
            end
        else
            if(output(cnt)==2366)
                if(output(cnt+1)==2375)
                    ukarl=length(ukar);
                    for x=1:ukarl
                        if(ukar(x)==test(cnt))
                            send(2370)
                            flag=1;
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
                        if(ukar(x)==test(cnt))
                            send(2369)
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
                        if(ukar(x)==test(cnt))
                            send(2370)
                            flag=1;
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
                        if(ukar(x)==test(cnt))
                            flag=1;
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
        if(output(cnt)~=2367 ||output(cnt)~=2368 || output(cnt)~=2366 )    % unicode changed  -- this is getting printed in notepad.
            send(output(cnt))
            send(2368) % unicode changed
            cnt=cnt+3;
        elseif(output(cnt+2)~=2367 ||output(cnt+2)~=2368 || output(cnt+2)~=2366 ) % unicode changed
            send(output(cnt+2))
            send(2367) % unicode changed
            cnt=cnt+3;
        else
            send(2368) % unicode changed
            cnt = cnt + 3;   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
    end
    if(counter(i)==4)
       for z=1:4
           if(output(cnt)==2339 || output(cnt)==2327 ||output(cnt)==2358)
               send(output(cnt))
               send(2367) % unicode changed
           end
           cnt=cnt+4;       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       end
    end
end
output
end

