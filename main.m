
% clc
% clear all
<<<<<<< Updated upstream
=======
pause('on')
set(groot,'defaultfigureposition',[400 250 900 750])
%% Testing for Ruben
load("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\data.mat");
addpath("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\group14-computervision-final\Test_Images");
%addpath("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\group14-computervision-final");

%% Testing
top_n = 8;  % Number of comparisons to return
test_dogs_dir = "G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\group14-computervision-final\Test_Images";
files = dir(test_dogs_dir);
files = files(~[files.isdir]);
test_dog_images = files(:,1);

for f=1:size(files,1)
    
%     img = imread('cow.jpg');
    img = imread(string(files(f).name));    

    dog_features = feature_extract(img);
    similarity_array = dist_calc(features, dog_features);
    [top, indices]=mink(similarity_array, top_n);
    figure(1);
    subplot(floor(top_n/3)+1,3,1);
    imshow(img,[]);
    title(f);
    for i = 1:top_n
        figure(1);
        subplot(floor(top_n/3)+1,3,i+1);
        imshow(imread(paths{indices(1,i)}), []);
        %imshow(imread(paths{indices(1,i)}), []);
        path = paths{indices(1,i)};
        breed = '-[A-Z a-z \w]+/';
        [start, endd] = regexp(path, breed);
        title(strrep(path(1,start+1:endd-1),'_',' '));
    end
    
    pause(1);
end
>>>>>>> Stashed changes

% to load matlab workspace which includes network and variables
% load('data.mat')

% test data (these should be the same)
num_image_paths = size(paths, 2)
num_feature_vecs = size(features, 2)



% loading data
index = 5;
img_path = paths{index}
img = imread(img_path);
feat_vec = features(:, index);
size(feat_vec)

img = imread('dog.jpg');
ind = sim_search(img, features, net)

sim = imread(paths{ind(1,2)});
imshow(sim)

