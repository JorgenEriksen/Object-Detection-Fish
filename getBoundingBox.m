function result = getBorderBox(img)
    highestPixle = findHighestPixel(img);
    lowerstPixle = findLowestPixel(img);
    leftPixle = findLeftPixel(img);
    rightPixle =  findRightPixel(img);
    result = [highestPixle lowerstPixle leftPixle rightPixle];
end

function result = findHighestPixel(img)
    result = -1;
    for y=1:size(img,1)
        for x=1:size(img,2)
            if(img(y,x) == 1 && result < 0)
                result = y;
            end
        end
    end
end

function result = findLeftPixel(img)
    result = 99999;
    for y=1:size(img,1)
        for x=1:size(img,2)
            if(img(y,x) == 1 && x < result)
                result = x;
            end
        end
    end
end

function result = findLowestPixel(img)
    result = 0;
    for y=1:size(img,1)
        for x=1:size(img,2)
            if(img(y,x) == 1)
                result = y;
            end
        end
    end
end

function result = findRightPixel(img)
    result = -1;
    for y=1:size(img,1)
        for x=1:size(img,2)
            if(img(y,x) == 1 && x > result)
                result = x;
            end
        end
    end
end