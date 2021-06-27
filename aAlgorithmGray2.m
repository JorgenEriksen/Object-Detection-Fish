function result = aAlgorithmGray2(img, isGreen)
I = rgb2gray(img);

%imshow(I);

%H = imhist(I);
%[~,Bval] = max(H);

%IB = 155 - Bval;
%if Bval>100
%  IB = IB + 25;
%end

gMin=10;
gMax=40;
if isGreen
    gMin=35;
    gMax=100;
end


%BW = imbinarize(I,x);

BW = zeros(size(I,1),size(I,2));
for y=1:size(I,1)
    for x=1:size(I,2)
        if(isInRange(I(y,x), gMin, gMax))
            BW(y,x) = 1;
        end
    end
end
%imshow(imbinarize);

%[counts,~] = imhist(BW);
%S=counts(1)/(sum(counts)/100);
%while S>10
%    if S>20
%        x=x-0.01*(S-10)/5; %for speed
%    end
%    x=x-0.01;
%    BW = imbinarize(I,x);
%    [counts,~] = imhist(BW);
%    S=counts(1)/(sum(counts)/100);
%end

BW = imfill(BW,'holes');
binaryImg=bwareaopen(BW, 50);
%binaryImg = imcomplement(BW);
%binaryImg=bwareaopen(binaryImg, 5000);


%inverseGrayImage = imcomplement(binaryImg);
result = binaryImg;

end


function result = isInRange(value, min, max) 
    result = false;
    if (min < value && value < max) 
        result = true;
    end 
end



