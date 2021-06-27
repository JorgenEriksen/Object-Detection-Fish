function showBoundingBox(fishimage, binaryImg, pos)

imshowpair(fishimage,binaryImg,'montage')
imshow(binaryImg)
figure,imshow(binaryImg)
hold on
rectangle('Position',[pos(3), pos(1), pos(4)-pos(3), pos(2)-pos(1)],'EdgeColor','r','LineWidth',2)
BW2 = bwareafilt(imshow,[40 50]);

end