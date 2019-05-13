clear, clc, close all

rng(0)   % to Control random number generation
data(:,1) = randn(30,1);
data(:,2) = 3.4 + 1.2 * data(:,1);
data(:,2) = data(:,2) + 0.2*randn(size(data(:,1)));
data = sortrows(data,1);

% Plot original data
figure
axes('LineWidth',0.6,...
    'FontName','Helvetica',...
    'FontSize',8,...
    'XAxisLocation','Origin',...
    'YAxisLocation','Origin');
line(data(:,1),data(:,2),...
    'LineStyle','None',...
    'Marker','o');
axis equal

% Compute the mean of all samples (Equation (3))
Mean_First_Col=mean(data(:,1));
Mean_Second_Col=mean(data(:,2));
% Or
% Mean=mean(data)  % but you need to use index to access each mean value

% Subtract the mean from all samples (Equation (4))
 data1(:,1) = data(:,1)-Mean_First_Col;
 data1(:,2) = data(:,2)-Mean_Second_Col;

%calculate the covariance matrix of data. 
%The covariance matrix contains all necessary information to rotate the coordinate system.
 C = cov(data1);
 
 %Compute the eigenvectors V and eigenvalues  of the covariance matrix 
[V,D] = eig(C);

% The rotation helps to create new variables which are uncorrelated,
% i.e. the covariance is zero for all pairs of the new variables.
% The decorrelation is achieved by diagonalizing the covariance matrix C. 
% The eigenvectors V belonging to the diagonalized covariance matrix are a linear combination of the old base vectors,
% thus expressing the correlation between the old and the new time series. We find the eigenvalues of the covariance matrix C by solving the equation 
% Calculating the data set in the new coordinate system. We need to flip newdata left/right since the second column is the one with the larges eigenvalue.

 newdata = V * data1';
 newdata = newdata';
 newdata = fliplr(newdata);
 
% % The eigenvalues of the covariance matrix (the diagonals of the diagonalized covariance matrix) 
% % indicate the variance in this (new) coordinate direction. We can us this information to calculate
% % the relative variance for each new variable by dividing the variances according to the eigenvectors
% % by the sum of the variances. In our example, the 1st and 2nd principal component contains 99.57 and 0.43 percent of the total variance in data.
 
Variances=var(newdata);
PCs_componenet=var(newdata)/sum(var(newdata));

% 
% Display the newdata together with the new coordinate system.
figure
axes('LineWidth',0.6,...
    'FontName','Helvetica',...
    'FontSize',8,...
    'XAxisLocation','Origin',...
    'YAxisLocation','Origin')
line(newdata(:,1),newdata(:,2),...
    'LineStyle','None',...
    'Marker','o');
axis equal

% % Do the same experiment using the MATLAB function PCA. We get same values for newdata and variance.
[coeff,newdata,latend,tsd,variance] = pca(data1);
  newdata
  variance
%%The new data are decorrelated.
 corrcoef(newdata)