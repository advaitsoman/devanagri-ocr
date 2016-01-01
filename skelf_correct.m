function output = skelf_correct(input)


%srcFiles = dir('C:\Users\Soman\Desktop\Character recognition\*.tiff');
 % the folder in which ur images exists
 

%a=imresize(input,[40,35]);
a=input;
%a=im2bw(a);
%a=imcomplement(a);
%img=imcomplement(im2bw(img));
%img1=regionprops(a,'FilledImage');
%img2=img1.FilledImage;
%img2=removeShirolekha(img2);
%img=imresize(img2,[40,40]);
regionImage=a;
regionImage= padarray(regionImage, [1 1]);
distanceImage = bwdist(~regionImage);
skeletonImage = bwmorph(regionImage, 'thin', inf);

strokeWidthImage = distanceImage;
strokeWidthImage(~skeletonImage) = 0;

% Show the region image alongside the stroke width image.
%figure
%subplot(1,2,1)
%imagesc(regionImage)
%title('Region Image')

%subplot(1,2,2)
%imagesc(strokeWidthImage)
%title('Stroke Width Image')

%a1=im2bw(strokeWidthImage);
a1=im2bw(strokeWidthImage);
%a1=imcomplement(a1);
%a1=imresize(a1,[40,35]);
%imshow(a1);
%p=mat2cell(a1,[20,20],[20,20]);
%for e=1:3
 %   for f=1:3
  %      [ u v ]= shadow(p{e,f});
   %     disp(u);
    %    disp(v);
   % end
%end
%disp('\n\n');

output=a1;
end