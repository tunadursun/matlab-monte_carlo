clear all all
clc 
l_radTD = 2; % long radius of ellipse
s_radTD = 1; % short radius of ellipse
kTD=[1,2,3,4,5,6,7];  
for iTD=1: length(kTD); 
    if (iTD==length(kTD)) 
        tic; % tic toc command to measure calculation time
        NTD = 10^iTD; % total number of sample points
        xTD = (rand(1,NTD)-0.5)*2*l_radTD; % x coordinates of points
        yTD = (rand(1,NTD)-0.5)*2*s_radTD; % y coordinates of points
        piteTD = (xTD.^2/l_radTD^2 + yTD.^2/s_radTD^2) <= 1; 
        sum_piteTD = sum(piteTD); 
        pi_approxTD(iTD) = 4*sum(piteTD)/NTD;       
        toc; 
    else
        NTD = 10^iTD; % total number of points
        xTD = (rand(1,NTD)-0.5)*2*l_radTD; % x coordinates of points
        yTD = (rand(1,NTD)-0.5)*2*s_radTD; % y coordinates of points
        piteTD = (xTD.^2/l_radTD^2 + yTD.^2/s_radTD^2) <= 1; 
        sum_piteTD = sum(piteTD); 
        pi_approxTD(iTD) = 4*sum(piteTD)/NTD; 
    end
end

disp('kTD         pi approx') 
disp('====================') 
for iTD=1:length(kTD) 
fprintf('%d          %f\n',[(iTD), pi_approxTD(iTD)]) 
end

angleTD = linspace(0,2*pi); 
x_axisTD = l_radTD*cos(angleTD); 
y_axisTD = s_radTD*sin(angleTD); 
plot(xTD(piteTD),yTD(piteTD),'y.'); 
hold on 
plot(xTD(~piteTD),yTD(~piteTD),'b.'); 
plot(x_axisTD,y_axisTD,'k--'); 
title('pi approximation with Monte Carlo'); 
xlabel('Long radius of ellipse'); 
ylabel('Short radius of ellipse'); 
axis equal 
grid on 