load('A2356run11')
%Remove first 1500 data points as they are useless
% IA(1:1:1500) = [];
% SA(1:1:1500) = [];
% NFY(1:1:1500) = [];
% FZ(1:1:1500) = [];
IA(IA > 2.1) = nan;
IA(IA < 1.9) = nan;

multiplier = IA.^0;
H75SA = multiplier.*SA;
H75NFY = multiplier.*NFY;
H75FZ = multiplier.*FZ;
H75SA(isnan(H75SA)) = [];
H75NFY(isnan(H75NFY)) = [];
H75FZ(isnan(H75FZ)) = [];
% plot3(H75FZ, H75SA, H75NFY);
% xlabel('FZ')
% ylabel('SA')
% zlabel('NFY')

plot(H75SA, H75NFY)
xlabel('SA')
ylabel('NFY')

writematrix(H75FZ, 'Hoosier 10in 7.5 FZ IA = 2.csv')
writematrix(H75SA, 'Hoosier 10in 7.5 IA = 2 SA.csv')
writematrix(H75NFY, 'Hoosier 10in 7.5 IA = 2 NFY.csv')

1+1
    

