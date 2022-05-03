
%% Import Data
% addpath(genpath(DIRNAME)); % recursively adds directory to matlab path
% load TireData.mat

tic
%% Run optimization or curve fitting
fun = @(SA0) mean(((NFY0/2) - mfModel(SA0deg,SA0)).^2);
SA0 = [5,1,2,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))
%% plot results
figure
plot(SA,(NFY/2));
hold on
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);
% %% Optimization over smooth data
% SNFY = smoothdata((NFY/2));
% fun = @(SA0) mean((SNFY - mfModel(SA,SA0)).^2);
% SA0 = [5,1,2,0,0,0]';
% x = fminunc(fun,SA0);
% fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))
% 
% %% Plot Smoothed Data
% figure
% plot(SA,SNFY);
% hold on
% sas = -14:0.1:14;
% mus = mfModel(sas,x);
% plot(sas,mus,'linewidth',2);
% toc