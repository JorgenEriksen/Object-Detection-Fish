function result = getAvarangeRed(img)
red=img(:,:,1);
green=img(:,:,2);
blue=img(:,:,3);
result = mean2(red);
end