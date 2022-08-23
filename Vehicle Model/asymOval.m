function [laptime] = asymOval(mass, power, area, drag_Coeff, mu)
%This is a striped down and simplified version of a lap time simulator.
%   
%   code should follow the structure asymOval(car_mass, power,
%   frontal_area, drag_coefficent, tire_friction_coeff)
% 
%   The track for this simulator is the asymetric oval track from Chris
%   Patton's paper on semi-transient lap time sim. This intakes the mass of
%   the car in pounds, the power of the car in horsepower, the frontal area
%   in square meters, the coefficient of drag as parameters, and the tire 
%   coefficent of friction that are used to solve for the expected lap time.
%   This simulation tool calculates the corner velocities according to
%   newtons laws and rotational motion a = v^2/r. Sim then uses these
%   corner velocities as starting points to calculate how the accelaration
%   into and out of corners using an eulers aproximation.
%     developed by Owen Geiger for the Ram Racing FSAE team

% define track
cornerRad1 = 8;
cornerRad2 = 20;
cornerlen1 = 21.8;
cornerlen2 = 70.9;
straight1 = 58;
straight2 = 58;

% define global variables
g = 9.8;
rho = 1.225;
Crr = 0.04;
d0 = 0.000001;
% converting to helpful units
mass = mass / 2.2;
power = power * 745.7;

% corner1 speed calculation
C1V = sqrt(mu*g*cornerRad1);
C1t = cornerlen1/C1V;

% Corner 2 speed calculation
C2V = sqrt(mu*g*cornerRad2);
C2t = cornerlen2/C2V;

% straight 1 calculation
V = zeros(1,1000);
X = zeros(1,1000);
V(1) = C1V;
X(1) = d0;
% forward accelaration
for indx = [1:1000]
    a = (power/mass)/V(indx) - (0.5*rho*area*drag_Coeff/mass)*(V(indx).^2) - g*Crr;
    Vn = V(indx)+ (0.01*a);
    V(indx+1) = Vn;
    Xn = X(indx)+ (0.01*V(indx));
    X(indx+1) = Xn;
    if Xn >= straight1
        break
    end
end
Vs1F = V(V~=0);
% braking acceleration
Vs1B = zeros(1,length(Vs1F)-1);
Vs1B(1) = C2V;
for indx = [1:length(Vs1F)-1]
    a = (g*mu)+(0.5*rho*area*drag_Coeff/mass)*(Vs1B(indx).^2) + g*Crr;
    Vn = Vs1B(indx)+ (0.01*a);
    Vs1B(indx+1) = Vn;
end
Vs1B = flip(Vs1B);
s1V = min([Vs1F;Vs1B]);

% straight 2 calculation
V = zeros(1,1000);
X = zeros(1,1000);
V(1) = C2V;
X(1) = d0;
% forward acceleation
for indx = [1:1000]
    a = (power/mass)/V(indx) - (0.5*rho*area*drag_Coeff/mass)*(V(indx).^2) - g*Crr;
    Vn = V(indx)+ (0.01*a);
    V(indx+1) = Vn;
    Xn = X(indx)+ (0.01*V(indx));
    X(indx+1) = Xn;
    if Xn >= straight2
        break
    end
end
Vs2F = V(V~=0);
% Braking acceleration
Vs2B = zeros(1,length(Vs2F)-1);
Vs2B(1) = C1V;
for indx = [1:length(Vs2F)-1]
    a = (g*mu)+(0.5*rho*area*drag_Coeff/mass)*(Vs2B(indx).^2) + g*Crr;
    Vn = Vs2B(indx)+ (0.01*a);
    Vs2B(indx+1) = Vn;
end
Vs2B = flip(Vs2B);
s2V = min([Vs2F;Vs2B]);

% getting the total drive time
laptime = (length(s1V)*0.01) + (length(s2V)*0.01) + C1t + C2t;
C1Vvec = C1V*ones(1,ceil(100*C1t));
C2Vvec = C2V*ones(1,ceil(100*C2t));
lapV = [C1Vvec,s1V,C2Vvec,s2V];
t = linspace(0,laptime,length(lapV));
figure("Name","Asymetric Oval Hot lap Simulation")
plot(t,lapV);
hold on
grid on
title("Hot lap Velocity vs Vime")
xlabel("Lap Time (s)")
ylabel('Velocity (m/s)')
hold off
end