
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
img = imread('Chihuahua.jpg');
dog_features = feature_extract(img);

