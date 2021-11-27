
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
load data
img = imread('Chihuahua.jpg');
dog_features = feature_extract(img);
similarity_array = dist_calc(features, dog_features);
top_n = 10;
[top, indices]=mink(similarity_array, top_n);
for i = 1:top_n
    figure();imshow(imread(paths{indices(1,i)}), []);
end

similar_dog_image = paths(1, similarity_array(1,2));
figure();imshow(imread(similar_dog_image{1,1}), []);

