clear;
close all ;
clc;
rng();
xmin = 10;
xmax = 20;
n = 200;
x = [xmin+rand(1,n)*(xmax-xmin)];
x = x';
ymin = 25;
ymax = 50;
y = [ymin+rand(1,n)*(ymax-ymin)];
y = y';
dataset = [x y];
plot(dataset(:,1),dataset(:,2),'*');
size = size(dataset);
for i=1:(size)
    if mod(i,2) == 0
        ind(i,1) = 1 ;
    else
        ind(i,1)= 2;
    end
end
trainingset = [x y];
K = 3;
Mdl = fitcknn(trainingset,ind,'NumNeighbors',K);
Spotx = [ 15 16 17 18 19 20 21 32];
Spoty = [ 26 27 28 29 30 41 42 40];
Spot = [Spotx' Spoty'];
[label,score,cost] = predict(Mdl,Spot);
trainingDataSet = [x y ind];
for i = 1:n
   if(trainingDataSet(i,3) == 1)
        hold on
        plot(trainingDataSet(i,1),trainingDataSet(i,2),'R*');
   elseif(trainingDataSet(i,3) == 2)
        hold on
        plot(trainingDataSet(i,1),trainingDataSet(i,2),'B*');
   end
end
hold on;
plot(Spot(:,1),Spot(:,2),'K*');
Spot  = [Spotx' Spoty' label];
for i = 1:n
   if(Spot(i,3) == 1)
        hold on
        plot(Spot(i,1),Spot(i,2),'G*');
   elseif(Spot(i,3) == 2)
        hold on
        plot(Spot(i,1),Spot(i,2),'C*');
   end
end