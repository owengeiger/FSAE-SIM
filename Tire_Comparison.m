%% Continental tire curve
contSA = load('Continental SA.csv');
filContSA = find(~isnan(contSA));
trunContSA = [];
for indx = [1:height(filContSA)]
    trunContSA(indx) = contSA(filContSA(indx));
end
contNFY = load('Continental NFY.csv');
filContNFY = find(~isnan(contNFY));
trunContNFY = [];
for indx = [1:height(filContNFY)]
    trunContNFY(indx) = contNFY(filContNFY(indx));
end

% curve function
fun = @(SA0) mean(((trunContNFY/2) - mfModel(trunContSA,SA0)).^2);
SA0 = [5,1,2,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6));

% Plot Continental
figure("Name",'Continental')
plot(trunContSA,(trunContNFY/2));
hold on;
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);

%% Hosier 7 Tire data
hoo7SA = load("hoosier7 SA.csv");
filHoo7SA = find(~isnan(hoo7SA));
trunHoo7SA = [];
for indx = [1:height(filHoo7SA)]
    trunHoo7SA(indx) = hoo7SA(filHoo7SA(indx));
end

hoo7NFY = load("hoosier7 NFY.csv");
filHoo7NFY = find(~isnan(hoo7NFY));
trunHoo7NFY = [];
for indx = [1:height(filHoo7NFY)]
    trunHoo7NFY(indx) = hoo7NFY(filHoo7NFY(indx));
end

fun = @(SA0) mean(((trunHoo7NFY/2) - mfModel(trunHoo7SA,SA0)).^2);
SA0 = [5,1,2,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))

% Plot Hoosier 7
figure("Name",'Hoosier 7')
plot(trunHoo7SA,(trunHoo7NFY/2));
hold on;
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);


%% Hoosier 7.5 Tire Data

hoo75SA = load("hoosier75 SA.csv");
filHoo75SA = find(~isnan(hoo75SA));
trunHoo75SA = [];
for indx = [1:height(filHoo75SA)]
    trunHoo75SA(indx) = hoo75SA(filHoo75SA(indx));
end

hoo75NFY = load("hoosier75 NFY.csv");
filHoo75NFY = find(~isnan(hoo75NFY));
trunHoo75NFY = [];
for indx = [1:height(filHoo75NFY)]
    trunHoo75NFY(indx) = hoo75NFY(filHoo75NFY(indx));
end

% Optimization
fun = @(SA0) mean(((trunHoo75NFY/2) - mfModel(trunHoo75SA,SA0)).^2);
SA0 = [5,1,2,0,0,0]';
x = fminunc(fun,SA0);
fprintf('Curve Fitted Magic Fromula coeffients B = %c, C = %c, D = %c, E = %c, Sh = %c, Sv = %c',x(1),x(2),x(3),x(4),x(5),x(6))

% Plot Hoosier 7
figure("Name",'Hoosier 7.5')
plot(trunHoo75SA,(trunHoo75NFY/2));
hold on;
sas = -14:0.1:14;
mus = mfModel(sas,x);
plot(sas,mus,'linewidth',2);

%% Combined Plot
figure("Name",'Combined graph')
plot(hoo75SA,hoo75NFY)
hold on
plot(hoo7SA,hoo7NFY)
plot(contSA,contNFY)
legend('Hoosier 7.5','Hoosier 7','Continental')
grid on
hold off

