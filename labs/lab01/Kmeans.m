close all
%Making data
xMin = 100;
xMax = 300;
n = 2000;
x = [xMin+rand(1,n)*(xMax-xMin)];
x = x';
yMin = 150;
yMax = 250;
y = [yMin+rand(1,n)*(yMax-yMin)];
y = y';
dataset = [x y];
[ind,cent,sum] = kmeans(dataset,4);
dataset = [x y ind];
for i = 1:n
   if(dataset(i,3) == 1)
        hold on
        plot(dataset(i,1),dataset(i,2),'R*');
   elseif(dataset(i,3) == 2)
        hold on
        plot(dataset(i,1),dataset(i,2),'B*');
  elseif(dataset(i,3) == 3)
        hold on
        plot(dataset(i,1),dataset(i,2),'K*');
   else
       hold on
       plot(dataset(i,1),dataset(i,2),'G*');
   end
end
hold on
plot(centroid(:,1),centroid(:,2),'KX')
figure
[silh3,h] = silhouette(dataset,ind,'sqEuclid');
title(['Number of clusters = ' int2str(k)]);
xlabel 'Silhouette Value';
ylabel 'cluster';
mean_silh = mean(sih);
disp(mean_silh);