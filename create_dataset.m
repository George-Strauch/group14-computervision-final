
clc
clear all

% path set up for specific linux machine
% http://vision.stanford.edu/aditya86/ImageNetDogs/
dogs_dir = '/run/media/george/STR/pics/dogs/Images/';
filelist = dir(fullfile(dogs_dir, '**/*.*'));  % get list of files and folders in any subfolder
filelist = filelist(~[filelist.isdir])

n = size(filelist, 1);
image_paths = cell(n, 1);

net = resnet50;
layer = 'avg_pool';
inputSize = [224, 224];
features = [];

for i = 1:n
    i % alive sig
    a = filelist(i);
    p = append(a.folder, '/', a.name);
    paths{i} = p;
    img = imread(p);
    img = imresize(img, inputSize);
    feat_vec = activations(net,[img],layer,'OutputAs','rows');
    features(:, i) = feat_vec;
end

% clean up variables
clear p;
clear img
clear feat_vec;
clear filelist;
clear a; 
clear n;
clear dogs_dir;

% save the matalb workspace
save('data.mat');



%{

% to load matlab workspace which includes network and variables
load('data.mat')

% test data (these should be the same)
num_image_paths = size(paths, 2)
num_feature_vecs = size(features, 2)

% loading data
index = 5;
img_path = paths{index}
img = imread(img_path);
feat_vec = features(:, index);
size(feat_vec)

%}



