
% clc
% clear all

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

%% Testing for Ruben
load("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\data.mat")
img = imread('Chihuahua.jpg');
dog_features = feature_extract(img);
similarity_array = dist_calc(features, dog_features);
top_n = 5;
[top, indices]=mink(similarity_array, top_n);
for i = 1:top_n
    figure();imshow(imread(paths{indices(1,i)}), []);
    path = paths{indices(1,i)};
    breed = '-[A-Z a-z \w]+/';
    [start, endd] = regexp(path, breed);
    title(path(1,start+1:endd-1));
end


