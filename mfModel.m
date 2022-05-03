function [mu] = mfModel(SA,SA0)
%6 Dimension  
%   Detailed explanation goes here
B = SA0(1),C=SA0(2),D= SA0(3),E= SA0(4),Sh= SA0(5),Sv= SA0(6);
mu=D*sin(C*atan(B*(SA+Sh)-E*(B*(SA+Sh)-atan(B*(SA+Sh)))))+Sv;
end

