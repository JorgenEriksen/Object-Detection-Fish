function isBlank = checkIfBlankImage(binaryImg)

isBlank = true;
[height, width] = size(binaryImg);
for y=1:height
    for x=1:width
        if(binaryImg(y,x) == 1)
            isBlank = false;
            break;
        end
    end
end

end