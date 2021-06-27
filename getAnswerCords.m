

function cords = getAnswerCords(filename)
    X = readtable('GroundTruth.xlsx');
    T = string(filename);
    %T = string('015001_GH020034.MP4.jpg');

    table_size = height(X); 
    rows = table_size(1); 
    for row = 1:rows 
        asd = X{row,1};
        asd = string(asd{1});
        if(asd == T)
            a = table2array(X(row,2));
            b = table2array(X(row,3));
            c = table2array(X(row,4));
            d = table2array(X(row,5));
        end
    end   
    cords = [a b c d];
end
