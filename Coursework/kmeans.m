% K-means clustering (unsupervised learning)
data = gen_kmeansdata(10574626);
columnMeans = mean(data);
stdOfData = std(data);
for i = 1:4
    figure(i);
    histogram(data(:,i));
    title(['Histogram of column ',num2str(i)]);
    xlabel('Data values');
    ylabel('Frequency');
    saveas(gcf,['Histogram of column ' num2str(i) '.png']);
end
