function results = dist_calc(dataset, testset)

    % testset can either be a matrix of image features
    % or a single image features array

    %dataset = featuresTrain;    %comment out
    %testset = featuresTest;     %comment out

    [rows cols] = size(testset);
    size_of_test = rows;

    [rows2 cols2] = size(dataset);
    size_of_dataset = rows2;

    results = zeros(size_of_test, rows2);

    for i = 1: size_of_test
        
        for j = 1:size_of_dataset
            test_data = testset(i,:);
            train_data = dataset(j,:);
            eu_dist = sqrt(sum(sum((test_data - train_data).^2)));
            
            results(i,j)=eu_dist;

        end
    end
end