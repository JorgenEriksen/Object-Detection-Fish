function result = getMostCorrectFish(possibleFish)
    maybeFishIndex = size(possibleFish,2);
    allResults = zeros(maybeFishIndex,4);
   
    widthHeightRatios = [];
    for k = 1 : maybeFishIndex
        highestPixle = possibleFish(k).BoundingBox(2);
        lowerstPixle =  possibleFish(k).BoundingBox(2) + possibleFish(k).BoundingBox(4);
        leftPixle = possibleFish(k).BoundingBox(1);
        rightPixle =  possibleFish(k).BoundingBox(1) + possibleFish(k).BoundingBox(3);
        allResults(k,:) = [highestPixle lowerstPixle leftPixle rightPixle];
        if (possibleFish(k).BoundingBox(3) > 150)
            widthHeightRatios(k) = possibleFish(k).BoundingBox(3) / possibleFish(k).BoundingBox(4);
        else
            widthHeightRatios(k) = 0;
        end

    end
    
    correctImageIndex = getHighestValueIndex(widthHeightRatios);
    
    %allResults(maybeFishIndex,:);
    
    result = allResults(correctImageIndex,:);
end


function result = getHighestValueIndex(widthHeightRatios)

currentIdx = 1;
currentHeightWidthRatio = -1;
for i = 1 : length(widthHeightRatios)
    if(widthHeightRatios(i) >= currentHeightWidthRatio)
        currentHeightWidthRatio = widthHeightRatios;
        currentIdx = i;
    end
end

result = currentIdx;
end