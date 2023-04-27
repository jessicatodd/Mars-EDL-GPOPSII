% Joint Plotting
clear all;
clc;
close all;

orion_l_15 = load('1P-Phase2/orion-LD.15.mat');
orion_l_25 = load('1P-Phase2/orion-LD.25.mat');
orion_l_35 = load('1P-Phase2/orion-LD.35.mat');
orion_l_5 = load('1P-Phase2/orion-LD.5.mat');
heavyorion_l_25 = load('1P-Phase2/cargo-LD.25.mat');
heavyorion_l_35 = load('1P-Phase2/cargo-LD.35.mat');
heavyorion_l_5 = load('1P-Phase2/cargo-LD.5.mat');

orion_l_15_SpaceX = load('1P-Phase2/orion-LD.15-SpaceX.mat');

heavyorion_l_25_SpaceX = load('1P-Phase2/cargo-LD.25-SpaceX.mat');

% Orion
timeOrion1 = orion_l_15.solution.phase(1).time;
timeOrion2 = orion_l_25.solution.phase(1).time;
timeOrion3 = orion_l_35.solution.phase(1).time;
timeOrion4 = orion_l_5.solution.phase(1).time;

timeOrionX = orion_l_15_SpaceX.solution.phase(1).time;

altOrion1    = (orion_l_15.solution.phase(1).state(:,1))/1000;
altOrion2    = (orion_l_25.solution.phase(1).state(:,1))/1000;
altOrion3    = (orion_l_35.solution.phase(1).state(:,1))/1000;
altOrion4    = (orion_l_5.solution.phase(1).state(:,1))/1000;

altOrionX    = (orion_l_15_SpaceX.solution.phase(1).state(:,1))/1000;

velOrion1    = (orion_l_15.solution.phase(1).state(:,2));
velOrion2    = (orion_l_25.solution.phase(1).state(:,2));
velOrion3    = (orion_l_35.solution.phase(1).state(:,2));
velOrion4    = (orion_l_5.solution.phase(1).state(:,2));

velOrionX    = (orion_l_15_SpaceX.solution.phase(1).state(:,2));

fpaOrion1 = orion_l_15.solution.phase(1).state(:,3)*180/pi;
fpaOrion2 = orion_l_25.solution.phase(1).state(:,3)*180/pi;
fpaOrion3 = orion_l_35.solution.phase(1).state(:,3)*180/pi;
fpaOrion4 = orion_l_5.solution.phase(1).state(:,3)*180/pi;

fpaOrionX = orion_l_15_SpaceX.solution.phase(1).state(:,3)*180/pi;

sOrion1    = (orion_l_15.solution.phase(1).state(:,4))/1000;
sOrion2    = (orion_l_25.solution.phase(1).state(:,4))/1000;
sOrion3   = (orion_l_35.solution.phase(1).state(:,4))/1000;
sOrion4    = (orion_l_5.solution.phase(1).state(:,4))/1000;

sOrionX    = (orion_l_15_SpaceX.solution.phase(1).state(:,4))/1000;

mOrion1    = (orion_l_15.solution.phase(1).state(:,5));
mOrion2    = (orion_l_25.solution.phase(1).state(:,5));
mOrion3   = (orion_l_35.solution.phase(1).state(:,5));
mOrion4    = (orion_l_5.solution.phase(1).state(:,5));

mOrionX    = (orion_l_15_SpaceX.solution.phase(1).state(:,5));

thrustOrion1 = orion_l_15.solution.phase(1).control(:,1)*100;
thrustOrion2 = orion_l_25.solution.phase(1).control(:,1)*100;
thrustOrion3 = orion_l_35.solution.phase(1).control(:,1)*100;
thrustOrion4 = orion_l_5.solution.phase(1).control(:,1)*100;

thrustOrionX = orion_l_15_SpaceX.solution.phase(1).control(:,1)*100;

% CargoOrion
timeCargo2 = heavyorion_l_25.solution.phase(1).time;
timeCargo3 = heavyorion_l_35.solution.phase(1).time;
timeCargo4 = heavyorion_l_5.solution.phase(1).time;

timeCargoX = heavyorion_l_25_SpaceX.solution.phase(1).time;

altCargo2    = (heavyorion_l_25.solution.phase(1).state(:,1))/1000;
altCargo3    = (heavyorion_l_35.solution.phase(1).state(:,1))/1000;
altCargo4    = (heavyorion_l_5.solution.phase(1).state(:,1))/1000;

altCargoX    = (heavyorion_l_25_SpaceX.solution.phase(1).state(:,1))/1000;

velCargo2    = (heavyorion_l_25.solution.phase(1).state(:,2));
velCargo3    = (heavyorion_l_35.solution.phase(1).state(:,2));
velCargo4   = (heavyorion_l_5.solution.phase(1).state(:,2));

velCargoX    = (heavyorion_l_25_SpaceX.solution.phase(1).state(:,2));

fpaCargo2 = heavyorion_l_25.solution.phase(1).state(:,3)*180/pi;
fpaCargo3 = heavyorion_l_35.solution.phase(1).state(:,3)*180/pi;
fpaCargo4 = heavyorion_l_5.solution.phase(1).state(:,3)*180/pi;

fpaCargoX = heavyorion_l_25_SpaceX.solution.phase(1).state(:,3)*180/pi;

sCargo2    = (heavyorion_l_25.solution.phase(1).state(:,4))/1000;
sCargo3    = (heavyorion_l_35.solution.phase(1).state(:,4))/1000;
sCargo4    = (heavyorion_l_5.solution.phase(1).state(:,4))/1000;

sCargoX    = (heavyorion_l_25_SpaceX.solution.phase(1).state(:,4))/1000;

mCargo2    = (heavyorion_l_25.solution.phase(1).state(:,5));
mCargo3    = (heavyorion_l_35.solution.phase(1).state(:,5));
mCargo4    = (heavyorion_l_5.solution.phase(1).state(:,5));

mCargoX    = (heavyorion_l_25_SpaceX.solution.phase(1).state(:,5));

thrustCargo2 = heavyorion_l_25.solution.phase(1).control(:,1)*100;
thrustCargo3 = heavyorion_l_35.solution.phase(1).control(:,1)*100;
thrustCargo4 = heavyorion_l_5.solution.phase(1).control(:,1)*100;

thrustCargoX = heavyorion_l_25_SpaceX.solution.phase(1).control(:,1)*100;


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
legend('Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(2)
hold on;

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
legend('Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
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
legend('Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
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

plot(timeOrion1, thrustOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2, thrustOrion2, 'Color', blue,'linewidth', 1.5');
plot(timeOrion3, thrustOrion3, 'Color', green,'linewidth', 1.5');
plot(timeOrion4, thrustOrion4, 'Color', red,'linewidth', 1.5');

%plot(timeCargo1, bankCargo1, ':','linewidth', 1.5');
plot(timeCargo2, thrustCargo2,'-.', 'Color', blue,'linewidth', 1.5');
plot(timeCargo3, thrustCargo3, '-.','Color', green,'linewidth', 1.5');
plot(timeCargo4, thrustCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Thrust ($\%$)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(5)
hold on;

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
legend('Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(6)
hold on;

plot(timeOrion1, mOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2, mOrion2, 'Color', blue,'linewidth', 1.5');
plot(timeOrion3, mOrion3, 'Color', green,'linewidth', 1.5');
plot(timeOrion4, mOrion4, 'Color', red,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Mass~(kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5');

%%
figure(7)
hold on;

%plot(timeCargo1, bankCargo1, ':','linewidth', 1.5');
plot(timeCargo2, mCargo2,'-.', 'Color', blue,'linewidth', 1.5');
plot(timeCargo3, mCargo3, '-.','Color', green,'linewidth', 1.5');
plot(timeCargo4, mCargo4, '-.','Color', red,'linewidth', 1.5');


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Mass~(kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
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


%% Plots for SRPS
figure(8)
hold on;

plot(timeOrion1, altOrion1, 'Color', blue, 'linewidth', 1.5');
plot(timeOrionX, altOrionX, 'Color', orange, 'linewidth', 1.5');

plot(timeCargo2, altCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(timeCargoX, altCargoX, '-.','Color', orange,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Altitude~(km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion - LOX-Methane', 'Orion - SuperDraco', 'Cargo - LOX-Methane', 'Cargo - SuperDraco');


figure(9)
hold on;

plot(timeOrion1, velOrion1, 'Color', blue, 'linewidth', 1.5');
plot(timeOrionX, velOrionX, 'Color', orange, 'linewidth', 1.5');

plot(timeCargo2, velCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(timeCargoX, velCargoX, '-.','Color', orange,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Velocity~(m/s)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion - LOX-Methane', 'Orion - SuperDraco', 'Cargo - LOX-Methane', 'Cargo - SuperDraco');

figure(10)
hold on;

plot(timeOrion1, fpaOrion1, 'Color', blue, 'linewidth', 1.5');
plot(timeOrionX, fpaOrionX, 'Color', orange, 'linewidth', 1.5');

plot(timeCargo2, fpaCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(timeCargoX, fpaCargoX, '-.','Color', orange,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Flight Path Angle~(deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion - LOX-Methane', 'Orion - SuperDraco', 'Cargo - LOX-Methane', 'Cargo - SuperDraco');

figure(11)
hold on;

plot(timeOrion1, thrustOrion1, 'Color', blue, 'linewidth', 1.5');
plot(timeOrionX, thrustOrionX, 'Color', orange, 'linewidth', 1.5');

plot(timeCargo2, thrustCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(timeCargoX, thrustCargoX, '-.','Color', orange,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Thrust ($\%$)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion - LOX-Methane', 'Orion - SuperDraco', 'Cargo - LOX-Methane', 'Cargo - SuperDraco');

figure(12)
hold on;

plot(timeOrion1, mOrion1, 'Color', blue, 'linewidth', 1.5');
plot(timeOrionX, mOrionX, 'Color', orange, 'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Mass (kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion - LOX-Methane', 'Orion - SuperDraco');

%%
figure(13)
hold on;
plot(timeCargo2, mCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(timeCargoX, mCargoX, '-.','Color', orange,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Mass (kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Cargo - LOX-Methane', 'Cargo - SuperDraco');

%%
figure(14)
hold on;

plot(velOrion1, altOrion1, 'Color', blue, 'linewidth', 1.5');
plot(velOrionX, altOrionX, 'Color', orange, 'linewidth', 1.5');

plot(velCargo2, altCargo2,'-.','Color', blue,  'linewidth', 1.5');
plot(velCargoX, altCargoX, '-.','Color', orange,'linewidth', 1.5');

xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend('Orion - LOX-Methane', 'Orion - SuperDraco', 'Cargo - LOX-Methane', 'Cargo - SuperDraco');


