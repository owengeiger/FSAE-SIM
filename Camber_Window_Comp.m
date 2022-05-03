% Load truncated data
SA0deg = readmatrix(['0degSA.csv']);
NFY0 = readmatrix("0degNFY.csv");

SA2 = readmatrix("2degSA.csv");
NFY2 = readmatrix("2degNFY.csv");

SA4 = readmatrix("4degSA.csv");
NFY4 = readmatrix("4degNFY.csv");

%% 0 deg plot

fun = @(SA0) mean(((NFY0/2) - mfModel(SA0deg,SA0)).^2);
SA0 = [1,1,1,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))
coef0deg = x

figure("Name",'0º Camber')
plot(SA0deg,(NFY0/2));
hold on;
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);

%% 2 deg plot

fun = @(SA0) mean(((NFY2/2) - mfModel(SA2,SA0)).^2);
SA0 = [5,1,2,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))
coef2deg = x

figure("Name",'2º Camber')
plot(SA2,(NFY2/2));
hold on;
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);

%% 4 deg plot

fun = @(SA0) mean(((NFY4/2) - mfModel(SA4,SA0)).^2);
SA0 = [1,1,1,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))
coef4deg = x

figure("Name",'4º Camber')
plot(SA4,(NFY4/2));
hold on;
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);

%% combined mu plot
mu0 = mfModel(sas,coef0deg);
mu2 = mfModel(sas,coef2deg);
mu4 = mfModel(sas,coef4deg);
figure("Name",'Magic Formual for Various Inclination Angles')
plot(sas,mu0)
hold on
plot(sas,mu2)
plot(sas,mu4,'k')
legend('Oº Camber','2º Camber','4º Camber')
xlabel('Slip Angle')
ylabel('Coefficient of friction')
text(-13,1.2,'all data at 100 lb Normal Force.')
grid on
hold off