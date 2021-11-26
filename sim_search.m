function results = sim_search(img, dataset, net)
    layer = 'avg_pool';
    inputSize = [224, 224];
    img = imresize(img, inputSize);
    img_features = activations(net,[img],layer,'OutputAs','rows');
    size(img_features)

    [rows2 cols2] = size(dataset);
    size_of_dataset = cols2;

    results = zeros(1, 3);
    dist = inf;

    for j = 1:size_of_dataset
        train_data = dataset(j,:);
        eu_dist = euclidean_dist(img_features(:), train_data);
        %eu_dist = sqrt(sum(sum((test_data-train_data).^2)));
        if j > 200
            break
        end
        if(eu_dist < dist)
            j
            eu_dist
            dist = eu_dist;
            results(1,2)=j;
            results(1,3)=dist;
        end
    end
end