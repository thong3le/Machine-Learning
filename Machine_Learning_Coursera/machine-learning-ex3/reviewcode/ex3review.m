clear; %delete all variables and functions from memory.
close all; % closes all open figure window. 
clc; %clear the command clwindow.

input_layer_size = 400;
num_labels = 10;

%%===PartI===

fprintf('Loading and Visualizing Data ...\n')

load('ex3data1.mat');
m = size(X, 1);

sel = X(randperm(m, 100), :);

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;

%%==Part II===

fprintf('\nTraining One-vs_All logistic Regression...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;

%%==Part III===

pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


