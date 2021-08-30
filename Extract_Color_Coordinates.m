clear all
close all
clc

it8=imresize(imread('IT8.7 (3093 px x 2062 px).jpg'),[2062 3093]); % import and resize to  2062*3093
printscorpio=imresize(imread('Prinscorpio (808 px x 799 px).jpg'),[799 808]); % import and resize to  799*808
xrite=imresize(imread('ColorChecker (1096 px x 728 px).jpg'),[728 1096]); % import and resize to  728*1096


% automated x-rite color checker color coordinate extraction
figure
imshow(xrite)
for i=1:6
    for j=1:4
        ind=i+(j-1)*6; % index
        xrite_color_area(ind,:)=[40+(i-1)*183,30+(j-1)*183,100,100];
        xrite_colors(ind,:)=uint8(mean(mean(imcrop(xrite,xrite_color_area(ind,:)))));
        rectangle('Position',xrite_color_area(ind,:),'EdgeColor','r')       
    end
end

writematrix(xrite_colors,'xrite_colors.txt')

% automated printscorpio color coordinate extraction
figure
imshow(printscorpio)
% Top color palette
for i=1:5
    for j=1:2
        ind=i+(j-1)*5;
        printscorpio_color_area_top(ind,:)=[65+(i-1)*150,40+(j-1)*115,75,65];
        printscorpio_colors(ind,:)=uint8(mean(mean(imcrop(printscorpio,printscorpio_color_area_top(ind,:)))));
        rectangle('Position',printscorpio_color_area_top(ind,:),'EdgeColor','r')       
    end
end
% Bottom color palette
for i=1:4
    for j=1:2
        ind=i+(j-1)*4;
        printscorpio_color_area_bot(ind,:)=[65+(i-1)*150,580+(j-1)*115,75,65];
        printscorpio_colors(ind+10,:)=uint8(mean(mean(imcrop(printscorpio,printscorpio_color_area_bot(ind,:)))));
        rectangle('Position',printscorpio_color_area_bot(ind,:),'EdgeColor','r')       
    end
end

writematrix(printscorpio_colors,'printscorpio_colors.txt')

% automated IT8.7 color checker color coordinate extraction
% colors
figure
imshow(it8)
for i=1:22
    for j=1:12
        ind=i+(j-1)*22;
        it8_color_area(ind,:)=[165+(i-1)*128.5,165+(j-1)*128,60,60];
        it8_colors(ind,:)=uint8(mean(mean(imcrop(it8,it8_color_area(ind,:)))));
        rectangle('Position',it8_color_area(ind,:),'EdgeColor','r')       
    end
end
% black and white
for i=1:22
    it8_bw_area(i,:)=[165+(i-1)*128.5,1900,60,60];
    it8_bw(i,:)=uint8(mean(mean(imcrop(it8,it8_bw_area(i,:)))));
    rectangle('Position',it8_bw_area(i,:),'EdgeColor','r')       
end

writematrix(it8_colors,'it8_colors.txt')
writematrix(it8_bw,'it8_bw.txt')

