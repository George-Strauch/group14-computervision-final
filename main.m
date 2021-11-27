
% clc
% clear all

%% Testing for Ruben
load("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\data.mat");
addpath("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\group14-computervision-final");
addpath("G:\My Drive\School\Fall 2021\INTRO TO COMPUTER VISION\Final Project\group14-computervision-final\Test_Images");

%% Testing
top_n = 8;

% Chihuahua
% img = imread('Chihuahua.jpg');

% Dog with baby
% img = imread('dog_with_baby.jpg');

% Dog with person
% img = imread('dog_with_person.jpg');

% German shepherd
% img = imread('German-shepherd.jpg');

% Golden retriever puppy
% img = imread('golder-retriever-puppy.jpeg');

dog_features = feature_extract(img);
similarity_array = dist_calc(features, dog_features);
[top, indices]=mink(similarity_array, top_n);
figure(1);
subplot(floor(top_n/3)+1,3,1);
imshow(img,[]);
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



