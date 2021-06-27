function newStruct = getObjects(bImg)
%make sure that the picture is inverted
BW=bwareafilt(bImg,15);
regions=regionprops(BW,'Image','BoundingBox');

MaxNumberOfObjects = size(regions,1);
% objects with a small size would not be acknowledged
ObjectTreshHold = 30;

newStruct = struct('Image',{},'BoundingBox',{});

for k = 1 : MaxNumberOfObjects
    if (size(regions(k).Image,1) > ObjectTreshHold &&   (size(regions(k).Image,2) > ObjectTreshHold))
        newStruct(end+1) = cell2struct({regions(k).Image,regions(k).BoundingBox},{'Image','BoundingBox'},2);
    end
end


end

