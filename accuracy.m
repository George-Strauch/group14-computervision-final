
clc
clear all

top_n = 20;  % Number of comparisons to return
n_test = 50;
test_inidcies = randi([1 20000],1,n_test,'uint32');

load data2.mat;
features = features';
net = resnet50;

accuracies = [];
for f=1:n_test
    index = test_inidcies(f);
    img_path = paths{index};
    img = imread(img_path); 

    breed = '-[A-Z a-z \w]+/';
    [start, endd] = regexp(img_path, breed);
    classification = strrep(img_path(1,start+1:endd-1),'_',' ');

    dog_features = feature_extract(img);
    similarity_array = dist_calc(features, dog_features);
    [top, indices]=mink(similarity_array, top_n);
%     size(top)
%     size(indices)
    good = (top ~= 0);
    indicies = indices(good);

    corr = 0;
    inc = 0;

    for i = 1:top_n-1
        path = paths{indices(1,i)};
        breed = '-[A-Z a-z \w]+/';
        [start, endd] = regexp(path, breed);
        c = strrep(path(1,start+1:endd-1),'_',' ');
        if strcmp(classification,c)
            corr = corr + 1;
        else
            inc = inc + 1;
        end
    end
    accuracies(end+1) = corr/(inc+corr)
end
disp('------------------')
accuracies
mean(accuracies)