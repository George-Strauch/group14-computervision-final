function results = calc_distance(dataset, testset)

    dataset = featuresTrain;    %comment out
    testset = featuresTest;     %comment out

    [rows cols] = size(testset);
    size_of_test = rows;

    [rows2 cols2] = size(dataset);
    size_of_dataset = rows2;

    results = zeros(size_of_test, 3);

    for i = 1: size_of_test
        dist = inf;
        results(i,1) = i;
        for j = 1:size_of_dataset
            test_data = testset(i,:);
            train_data = dataset(j,:);
            eu_dist = sqrt(sum(sum((test_data - train_data).^2)));
            if(eu_dist < dist)
                dist = eu_dist;
                results(i,2)=j;
                results(i,3)=dist;
            end
        end
    end
end