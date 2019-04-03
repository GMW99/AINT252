% K-means clustering (unsupervised learning)
data = gen_kmeansdata(10574626);
columnMeans = mean(data);
stdOfData = std(data);
figure(1);
histogram(X(:,1));
figure(2);
histogram(X(:,2));
figure(3);
histogram(X(:,3));
figure(4);
histogram(X(:,4));

