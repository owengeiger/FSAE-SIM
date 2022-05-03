% The modified data is coming from the tire Tamer and run 11
%% 0 degree
% filNFY = find(~isnan(NFY0deg));
% trunNFY = [];
% for indx = [1:height(filNFY)]
%     trunNFY(indx) = NFY0deg(filNFY(indx));
% end

filSA = find(~isnan(SA0deg));
trunSA = [];
for indx = [1:height(filSA)]
    trunSA(indx) = SA0deg(filSA(indx));
end
writematrix(trunSA,'0degSA.csv');
% writematrix(trunNFY,'0degNFY.csv');

%% 2 degree
filNFY = find(~isnan(NFY2deg));
trunNFY = [];
for indx = [1:height(filNFY)]
    trunNFY(indx) = NFY2deg(filNFY(indx));
end

filSA = find(~isnan(SA2deg));
trunSA = [];
for indx = [1:height(filSA)]
    trunSA(indx) = SA2deg(filSA(indx));
end
writematrix(trunSA,'2degSA.csv');
writematrix(trunNFY,'2degNFY.csv');

% 4 degree
filNFY = find(~isnan(NFY4deg));
trunNFY = [];
for indx = [1:height(filNFY)]
    trunNFY(indx) = NFY4deg(filNFY(indx));
end

filSA = find(~isnan(SA4deg));
trunSA = [];
for indx = [1:height(filSA)]
    trunSA(indx) = SA4deg(filSA(indx));
end
writematrix(trunSA,'4degSA.csv');
writematrix(trunNFY,'4degNFY.csv');
