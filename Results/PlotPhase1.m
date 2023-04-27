% Joint Plotting
clear all;
clc;
close all;

msl_l = load('1P-Phase1/msl-vLow-P1.mat');
orion_l_15 = load('1P-Phase1/orion-LD.15-vLow-P1.mat');
orion_l_25 = load('1P-Phase1/orion-LD.25-vLow-P1.mat');
orion_l_35 = load('1P-Phase1/orion-LD.35-vLow-P1.mat');
orion_l_5 = load('1P-Phase1/orion-LD.5-vLow-P1.mat');
heavyorion_l_15 = load('1P-Phase1/heavyorion-LD.15-vLow-P1.mat');
heavyorion_l_25 = load('1P-Phase1/heavyorion-LD.25-vLow-P1.mat');
heavyorion_l_35 = load('1P-Phase1/heavyorion-LD.35-vLow-P1.mat');
heavyorion_l_5 = load('1P-Phase1/heavyorion-LD.5-vLow-P1.mat');

% msl_h = load('Todd 16.32 Project 2020/Results/msl-vHigh-P1.mat');
% orion_h_15 = load('Todd 16.32 Project 2020/Results/orion-LD.15-vHigh-P1.mat');
% orion_h_25 = load('Todd 16.32 Project 2020/Results/orion-LD.25-vHigh-P1.mat');
% orion_h_35 = load('Todd 16.32 Project 2020/Results/orion-LD.35-vHigh-P1.mat');
% orion_h_5 = load('Todd 16.32 Project 2020/Results/orion-LD.5-vHigh-P1.mat');
% heavyorion_h_15 = load('Todd 16.32 Project 2020/Results/heavyorion-LD.15-vHigh-P1.mat');
% heavyorion_h_25 = load('Todd 16.32 Project 2020/Results/heavyorion-LD.25-vHigh-P1.mat');
% heavyorion_h_35 = load('Todd 16.32 Project 2020/Results/heavyorion-LD.35-vHigh-P1.mat');
% heavyorion_h_5 = load('Todd 16.32 Project 2020/Results/heavyorion-LD.5-vHigh-P1.mat');


% Orion
timeOrion1 = orion_l_15.solution.phase(1).time;
timeOrion2 = orion_l_25.solution.phase(1).time;
timeOrion3 = orion_l_35.solution.phase(1).time;
timeOrion4 = orion_l_5.solution.phase(1).time;

altOrion1    = (orion_l_15.solution.phase(1).state(:,1))/1000;
altOrion2    = (orion_l_25.solution.phase(1).state(:,1))/1000;
altOrion3    = (orion_l_35.solution.phase(1).state(:,1))/1000;
altOrion4    = (orion_l_5.solution.phase(1).state(:,1))/1000;

velOrion1    = (orion_l_15.solution.phase(1).state(:,2));
velOrion2    = (orion_l_25.solution.phase(1).state(:,2));
velOrion3    = (orion_l_35.solution.phase(1).state(:,2));
velOrion4    = (orion_l_5.solution.phase(1).state(:,2));

fpaOrion1 = orion_l_15.solution.phase(1).state(:,3)*180/pi;
fpaOrion2 = orion_l_25.solution.phase(1).state(:,3)*180/pi;
fpaOrion3 = orion_l_35.solution.phase(1).state(:,3)*180/pi;
fpaOrion4 = orion_l_5.solution.phase(1).state(:,3)*180/pi;

sOrion1    = (orion_l_15.solution.phase(1).state(:,4))/1000;
sOrion2    = (orion_l_25.solution.phase(1).state(:,4))/1000;
sOrion3   = (orion_l_35.solution.phase(1).state(:,4))/1000;
sOrion4    = (orion_l_5.solution.phase(1).state(:,4))/1000;

bankOrion1 = acosd(orion_l_15.solution.phase(1).control(:,1));
bankOrion2 = acosd(orion_l_25.solution.phase(1).control(:,1));
bankOrion3 = acosd(orion_l_35.solution.phase(1).control(:,1));
bankOrion4 = acosd(orion_l_5.solution.phase(1).control(:,1));

% CargoOrion
timeCargo1 = heavyorion_l_15.solution.phase(1).time;
timeCargo2 = heavyorion_l_25.solution.phase(1).time;
timeCargo3 = heavyorion_l_35.solution.phase(1).time;
timeCargo4 = heavyorion_l_5.solution.phase(1).time;

altCargo1    = (heavyorion_l_15.solution.phase(1).state(:,1))/1000;
altCargo2    = (heavyorion_l_25.solution.phase(1).state(:,1))/1000;
altCargo3    = (heavyorion_l_35.solution.phase(1).state(:,1))/1000;
altCargo4    = (heavyorion_l_5.solution.phase(1).state(:,1))/1000;

velCargo1    = (heavyorion_l_15.solution.phase(1).state(:,2));
velCargo2    = (heavyorion_l_25.solution.phase(1).state(:,2));
velCargo3    = (heavyorion_l_35.solution.phase(1).state(:,2));
velCargo4   = (heavyorion_l_5.solution.phase(1).state(:,2));

fpaCargo1 = heavyorion_l_15.solution.phase(1).state(:,3)*180/pi;
fpaCargo2 = heavyorion_l_25.solution.phase(1).state(:,3)*180/pi;
fpaCargo3 = heavyorion_l_35.solution.phase(1).state(:,3)*180/pi;
fpaCargo4 = heavyorion_l_5.solution.phase(1).state(:,3)*180/pi;

sCargo1    = (heavyorion_l_15.solution.phase(1).state(:,4))/1000;
sCargo2    = (heavyorion_l_25.solution.phase(1).state(:,4))/1000;
sCargo3    = (heavyorion_l_35.solution.phase(1).state(:,4))/1000;
sCargo4    = (heavyorion_l_5.solution.phase(1).state(:,4))/1000;

bankCargo1 = acosd(heavyorion_l_15.solution.phase(1).control(:,1));
bankCargo2 = acosd(heavyorion_l_25.solution.phase(1).control(:,1));
bankCargo3 = acosd(heavyorion_l_35.solution.phase(1).control(:,1));
bankCargo4 = acosd(heavyorion_l_5.solution.phase(1).control(:,1));

% MSL
timeMSL        = msl_l.solution.phase(1).time;
altitudeMSL    = (msl_l.solution.phase(1).state(:,1))/1000;
velocityMSL    = msl_l.solution.phase(1).state(:,2);
fpaMSL         = msl_l.solution.phase(1).state(:,3)*180/pi;
sMSL           = msl_l.solution.phase(1).state(:,4)/1000;
bankMSL        = acosd(msl_l.solution.phase(1).control(:,1));


% Specify colours
blue = [0    0.4470    0.7410 ];% Blue
orange = [0.8500    0.3250    0.0980]; % Orange
yellow = [0.9290    0.6940    0.1250]; % Yellow
purple = [0.4940    0.1840    0.5560]; % Purple
green = [0.4660    0.6740    0.1880]; % Green
lblue = [0.3010    0.7450    0.9330]; % Light blue
red = [0.6350    0.0780    0.1840];  % Red


%---------------%
% Plot Solution %
%---------------%
figure(1)
hold on;
plot(timeMSL,altitudeMSL,'--k','linewidth', 1.5);

plot(timeOrion1, altOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2, altOrion2, 'Color', blue, 'linewidth', 1.5');
plot(timeOrion3, altOrion3, 'Color', green, 'linewidth', 1.5');
plot(timeOrion4, altOrion4, 'Color', red, 'linewidth', 1.5');

%plot(timeCargo1, altCargo1, ':','linewidth', 1.5');
plot(timeCargo2, altCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(timeCargo3, altCargo3, '-.','Color', green,'linewidth', 1.5');
plot(timeCargo4, altCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Altitude~(km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('MSL', 'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(2)
hold on;

plot(timeMSL,velocityMSL,'--k','linewidth', 1.5);

plot(timeOrion1, velOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2, velOrion2, 'Color', blue,'linewidth', 1.5');
plot(timeOrion3, velOrion3, 'Color', green,'linewidth', 1.5');
plot(timeOrion4, velOrion4, 'Color', red,'linewidth', 1.5');

%plot(timeCargo1, altCargo1, ':','linewidth', 1.5');
plot(timeCargo2, velCargo2,'-.', 'Color', blue, 'linewidth', 1.5');
plot(timeCargo3, velCargo3, '-.','Color', green,'linewidth', 1.5');
plot(timeCargo4, velCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Velocity~(m/s)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('MSL', 'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

% 
% plot(time1,velocity1*1000,'linewidth', 1.5);
% plot(timeMSL,velocityMSL*1000,'linewidth', 1.5);
% xl = xlabel('$t$~(s)','Interpreter','LaTeX');
% yl = ylabel('Velocity~(m/s)','Interpreter','LaTeX');
% set(xl,'FontSize',18);
% set(yl,'FontSize',18);
% set(gca,'FontSize',16,'FontName','Times');
% grid on
% legend('Human EV', 'MSL');

%%
figure(3)
hold on;

plot(timeMSL,fpaMSL,'--k','linewidth', 1.5);

plot(timeOrion1, fpaOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2, fpaOrion2, 'Color', blue,'linewidth', 1.5');
plot(timeOrion3, fpaOrion3, 'Color', green,'linewidth', 1.5');
plot(timeOrion4, fpaOrion4, 'Color', red,'linewidth', 1.5');

%plot(timeCargo1, altCargo1, ':','linewidth', 1.5');
plot(timeCargo2, fpaCargo2,'-.', 'Color', blue,'linewidth', 1.5');
plot(timeCargo3, fpaCargo3, '-.','Color', green,'linewidth', 1.5');
plot(timeCargo4, fpaCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Flight Path Angle~(deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('MSL', 'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');



% plot(time1,fpa1, 'linewidth', 1.5);
% plot(timeMSL,fpaMSL, 'linewidth', 1.5);
% xl = xlabel('$t$~(s)','Interpreter','LaTeX');
% yl = ylabel('$\gamma(t)$~(deg)','Interpreter','LaTeX');
% set(xl,'FontSize',18);
% set(yl,'FontSize',18);
% set(gca,'FontSize',16,'FontName','Times');
% set(gca,'FontSize',16);
% grid on
% legend('Human EV', 'MSL');

%%
figure(4)
hold on;

plot(timeMSL,bankMSL,'--k','linewidth', 1.5);

plot(timeOrion1, bankOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2, bankOrion2, 'Color', blue,'linewidth', 1.5');
plot(timeOrion3, bankOrion3, 'Color', green,'linewidth', 1.5');
plot(timeOrion4, bankOrion4, 'Color', red,'linewidth', 1.5');

%plot(timeCargo1, bankCargo1, ':','linewidth', 1.5');
plot(timeCargo2, bankCargo2,'-.', 'Color', blue,'linewidth', 1.5');
plot(timeCargo3, bankCargo3, '-.','Color', green,'linewidth', 1.5');
plot(timeCargo4, bankCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Bank Angle~(deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('MSL', 'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(5)
hold on;

plot(velocityMSL,altitudeMSL,'--k','linewidth', 1.5);

plot(velOrion1, altOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(velOrion2, altOrion2, 'Color', blue,'linewidth', 1.5');
plot(velOrion3, altOrion3, 'Color', green,'linewidth', 1.5');
plot(velOrion4, altOrion4, 'Color', red,'linewidth', 1.5');

%plot(timeCargo1, bankCargo1, ':','linewidth', 1.5');
plot(velCargo2, altCargo2,'-.', 'Color', blue,'linewidth', 1.5');
plot(velCargo3, altCargo3, '-.','Color', green,'linewidth', 1.5');
plot(velCargo4, altCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('MSL', 'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');



% plot(velocity1*1000, altitude1, 'linewidth', 1.5);
% plot(velocityMSL*1000, altitudeMSL, 'linewidth', 1.5);
% xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
% yl = ylabel('Altitude (km)','Interpreter','LaTeX');
% set(xl,'FontSize',18);
% set(yl,'FontSize',18);
% set(gca,'FontSize',16,'FontName','Times');
% set(gca,'FontSize',16);
% grid on
% legend('Human EV', 'MSL');
% 
% 
% 
