clc
clear all

%filename = '015001_GH020034.MP4.jpg';
dinfo = dir('assets/Testing/*.jpg');
names_cell = {dinfo.name};
image = convertCharsToStrings({dinfo.name});

colorResults = zeros(146,1); % array with all results
greyScaleResults = zeros(146,1);

allResults = []; % array with all results
filenames = string(char); %array with filenames of "blank" pictures
%size(names_cell,2)
allFilenames = strings(1);

for i=1:size(names_cell,2)
    % get an image from the test set
    filename = names_cell{i};
    filePath = "assets/Testing/" + filename;
    fishimage = imread(filePath);
    
    isGreen = false;
    if(getAvarangeRed(fishimage) < 90)
        isGreen = true;
    end
    
    algoResult = jAlgoritmeColor(fishimage, isGreen); % algoritme to create binary image
    if(checkIfBlankImage(algoResult))
        result = 0;
    else 
        possibleFishes = getObjects(algoResult); % get all objects in binary image
        algBoundingBox = getMostCorrectFish(possibleFishes); % finds the most correct fish and returns the bounding box
        answerBoundingBox = getAnswerCords(filename); % get the answer cords
        result = compareBoxes(algBoundingBox, answerBoundingBox, fishimage); % compare the result
    end
    colorResults(i,:) = result; %save the result
    
    algoResult = aAlgorithmGray2(fishimage, isGreen); % algoritme to create binary image
    if(checkIfBlankImage(algoResult))
        result = 0;
    else 
        possibleFishes = getObjects(algoResult); % get all objects in binary image
        algBoundingBox = getMostCorrectFish(possibleFishes); % finds the most correct fish and returns the bounding box
        answerBoundingBox = getAnswerCords(filename); % get the answer cords
        result = compareBoxes(algBoundingBox, answerBoundingBox, fishimage); % compare the result
    end
    
    if(result <0.3)
        %imshow(filePath)
        filenames(end+1)= names_cell{i};
        %{
        reply = questdlg('Continue?','Continue', 'OK','Cancel', 'OK');
            if strcmpi(reply, 'Cancel')
            % Stop if canceled.
            return;
        end
        %}
    end

    greyScaleResults(i,:) = result; %save the result
    
    
    %allResults(end+1) = result; %save the result
    %showBoundingBox(fishimage, algoResult, algBoundingBox)
end

% xlswrite('result.xlsx',allResults);
% prints the results
% allResults

imageName = transpose(image);

T = table(imageName ,colorResults, greyScaleResults);
excelName = "results.xlsx";
writetable(T,excelName,'Sheet',1,'Range','A:C');
colorResults;

[~,s]=size(filenames);
for i=2:s
    filePath = "assets/Testing/" + filenames(i);
    fishimage = imread(filePath);
    figure, imshow(fishimage) %opens all "bad" images
    
    reply = questdlg('Continue?','Continue', 'OK','Cancel', 'OK');
    if strcmpi(reply, 'Cancel')
        return;% Stop if canceled.
    end
    
end
