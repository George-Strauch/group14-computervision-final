function result = feature_extract(image)

    img = image;
    net = resnet50;
    layer = 'avg_pool';
    inputSize = [224, 224];
    features = [];

    img = imresize(img, inputSize);
    feat_vec = activations(net,[img],layer,'OutputAs','rows');
    features(1,:) = feat_vec;

    result = features;

end