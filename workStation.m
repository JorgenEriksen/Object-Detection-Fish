%filePath = "assets/Testing/" + "011001_GH010036.MP4.jpg";

%filename = "011001_GH030034.MP4_3.jpg"
%filename = "015001_GH020034.MP4.jpg"
%filePath = "assets/Testing/" + filename; %gray

%filePath = "assets/Testing/" + "019001_GH010035.MP4.jpg"; 
%filePath = "assets/Testing/" + "015001_GH020034.MP4.jpg"; 
filename =  "b_013876_Gx020023-1.m4v.jpg"
filePath = "assets/Testing/" + filename; 

img = imread(filePath);

isGreen = false;
if(getAvarangeRed(img) < 90)
    isGreen = true
end


algoResult = jAlgoritmeColor(img, isGreen);
%imshow(img)



if(checkIfBlankImage(algoResult))
        result = 0;
else 
    possibleFishes = getObjects(algoResult); % get all objects in binary image
    algBoundingBox = getMostCorrectFish(possibleFishes); % finds the most correct fish and returns the bounding box
    answerBoundingBox = getAnswerCords(filename); % get the answer cords
    result = compareBoxes(algBoundingBox, answerBoundingBox, img); % compare the result
end

%showBoundingBox(img, algoResult, algBoundingBox)
answerBoundingBox(1) % tok
answerBoundingBox(2) % low
answerBoundingBox(3)
answerBoundingBox(4)



imshow(img);
hold on
%rectangle('Position',[827, 175, 174, 119],'EdgeColor','g','LineWidth',2)
rectangle('Position',[answerBoundingBox(3), answerBoundingBox(1), answerBoundingBox(4)-answerBoundingBox(3), answerBoundingBox(2)-answerBoundingBox(1)],'EdgeColor','g','LineWidth',2)
rectangle('Position',[algBoundingBox(3), algBoundingBox(1), algBoundingBox(4)-algBoundingBox(3), algBoundingBox(2)-algBoundingBox(1)],'EdgeColor','r','LineWidth',2)



%imshow(img)
result