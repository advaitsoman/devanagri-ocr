function send(input1)
fid = fopen('test.txt', 'a');
%fwrite(fid, unicode2native(char(hex2dec(input1)),'UTF-8'),'uint8');
fwrite(fid, unicode2native(char(input1),'UTF-8'),'uint8');
fclose(fid);
end