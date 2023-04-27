% Joint Plotting
clear all;
clc;
close all;

orion_l_15 = load('2P/orion-LD.15.mat');
orion_l_25 = load('2P/orion-LD.25.mat');
orion_l_35 = load('2P/orion-LD.35.mat');
orion_l_5 = load('2P/orion-LD.5.mat');
heavyorion_l_15 = load('2P/cargo-LD.15.mat');
heavyorion_l_25 = load('2P/cargo-LD.25.mat');
heavyorion_l_35 = load('2P/cargo-LD.35.mat');
heavyorion_l_5 = load('2P/cargo-LD.5.mat');


% Orion
timeOrion1a = orion_l_15.solution.phase(1).time;
timeOrion2a = orion_l_25.solution.phase(1).time;
timeOrion3a = orion_l_35.solution.phase(1).time;
timeOrion4a = orion_l_5.solution.phase(1).time;

timeOrion1b = orion_l_15.solution.phase(2).time;
timeOrion2b = orion_l_25.solution.phase(2).time;
timeOrion3b = orion_l_35.solution.phase(2).time;
timeOrion4b = orion_l_5.solution.phase(2).time;

altOrion1a    = (orion_l_15.solution.phase(1).state(:,1))/1000;
altOrion2a    = (orion_l_25.solution.phase(1).state(:,1))/1000;
altOrion3a    = (orion_l_35.solution.phase(1).state(:,1))/1000;
altOrion4a    = (orion_l_5.solution.phase(1).state(:,1))/1000;

altOrion1b    = (orion_l_15.solution.phase(2).state(:,1))/1000;
altOrion2b    = (orion_l_25.solution.phase(2).state(:,1))/1000;
altOrion3b    = (orion_l_35.solution.phase(2).state(:,1))/1000;
altOrion4b    = (orion_l_5.solution.phase(2).state(:,1))/1000;

velOrion1a    = (orion_l_15.solution.phase(1).state(:,2));
velOrion2a    = (orion_l_25.solution.phase(1).state(:,2));
velOrion3a    = (orion_l_35.solution.phase(1).state(:,2));
velOrion4a    = (orion_l_5.solution.phase(1).state(:,2));

velOrion1b    = (orion_l_15.solution.phase(2).state(:,2));
velOrion2b    = (orion_l_25.solution.phase(2).state(:,2));
velOrion3b    = (orion_l_35.solution.phase(2).state(:,2));
velOrion4b    = (orion_l_5.solution.phase(2).state(:,2));

fpaOrion1a = orion_l_15.solution.phase(1).state(:,3)*180/pi;
fpaOrion2a = orion_l_25.solution.phase(1).state(:,3)*180/pi;
fpaOrion3a = orion_l_35.solution.phase(1).state(:,3)*180/pi;
fpaOrion4a = orion_l_5.solution.phase(1).state(:,3)*180/pi;


fpaOrion1b = orion_l_15.solution.phase(2).state(:,3)*180/pi;
fpaOrion2b = orion_l_25.solution.phase(2).state(:,3)*180/pi;
fpaOrion3b = orion_l_35.solution.phase(2).state(:,3)*180/pi;
fpaOrion4b = orion_l_5.solution.phase(2).state(:,3)*180/pi;

sOrion1a    = (orion_l_15.solution.phase(1).state(:,4))/1000;
sOrion2a    = (orion_l_25.solution.phase(1).state(:,4))/1000;
sOrion3a   = (orion_l_35.solution.phase(1).state(:,4))/1000;
sOrion4a   = (orion_l_5.solution.phase(1).state(:,4))/1000;

sOrion1b    = (orion_l_15.solution.phase(2).state(:,4))/1000;
sOrion2b    = (orion_l_25.solution.phase(2).state(:,4))/1000;
sOrion3b   = (orion_l_35.solution.phase(2).state(:,4))/1000;
sOrion4b   = (orion_l_5.solution.phase(2).state(:,4))/1000;

mOrion1    = (orion_l_15.solution.phase(2).state(:,5));
mOrion2    = (orion_l_25.solution.phase(2).state(:,5));
mOrion3   = (orion_l_35.solution.phase(2).state(:,5));
mOrion4    = (orion_l_5.solution.phase(2).state(:,5));

bankOrion1 = acosd(orion_l_15.solution.phase(1).control(:,1));
bankOrion2 = acosd(orion_l_25.solution.phase(1).control(:,1));
bankOrion3 = acosd(orion_l_35.solution.phase(1).control(:,1));
bankOrion4 = acosd(orion_l_5.solution.phase(1).control(:,1));

thrustOrion1 = orion_l_15.solution.phase(2).control(:,1)*100;
thrustOrion2 = orion_l_25.solution.phase(2).control(:,1)*100;
thrustOrion3 = orion_l_35.solution.phase(2).control(:,1)*100;
thrustOrion4 = orion_l_5.solution.phase(2).control(:,1)*100;

% CargoOrion
timeCargo1a = heavyorion_l_15.solution.phase(1).time;
timeCargo2a = heavyorion_l_25.solution.phase(1).time;
timeCargo3a = heavyorion_l_35.solution.phase(1).time;
timeCargo4a = heavyorion_l_5.solution.phase(1).time;

timeCargo1b = heavyorion_l_15.solution.phase(2).time;
timeCargo2b = heavyorion_l_25.solution.phase(2).time;
timeCargo3b = heavyorion_l_35.solution.phase(2).time;
timeCargo4b = heavyorion_l_5.solution.phase(2).time;

altCargo1a    = (heavyorion_l_15.solution.phase(1).state(:,1))/1000;
altCargo2a    = (heavyorion_l_25.solution.phase(1).state(:,1))/1000;
altCargo3a    = (heavyorion_l_35.solution.phase(1).state(:,1))/1000;
altCargo4a    = (heavyorion_l_5.solution.phase(1).state(:,1))/1000;

altCargo1b    = (heavyorion_l_15.solution.phase(2).state(:,1))/1000;
altCargo2b    = (heavyorion_l_25.solution.phase(2).state(:,1))/1000;
altCargo3b    = (heavyorion_l_35.solution.phase(2).state(:,1))/1000;
altCargo4b    = (heavyorion_l_5.solution.phase(2).state(:,1))/1000;

velCargo1a    = (heavyorion_l_15.solution.phase(1).state(:,2));
velCargo2a    = (heavyorion_l_25.solution.phase(1).state(:,2));
velCargo3a    = (heavyorion_l_35.solution.phase(1).state(:,2));
velCargo4a    = (heavyorion_l_5.solution.phase(1).state(:,2));

velCargo1b    = (heavyorion_l_15.solution.phase(2).state(:,2));
velCargo2b    = (heavyorion_l_25.solution.phase(2).state(:,2));
velCargo3b    = (heavyorion_l_35.solution.phase(2).state(:,2));
velCargo4b    = (heavyorion_l_5.solution.phase(2).state(:,2));

fpaCargo1a = heavyorion_l_15.solution.phase(1).state(:,3)*180/pi;
fpaCargo2a = heavyorion_l_25.solution.phase(1).state(:,3)*180/pi;
fpaCargo3a = heavyorion_l_35.solution.phase(1).state(:,3)*180/pi;
fpaCargo4a = heavyorion_l_5.solution.phase(1).state(:,3)*180/pi;


fpaCargo1b = heavyorion_l_15.solution.phase(2).state(:,3)*180/pi;
fpaCargo2b = heavyorion_l_25.solution.phase(2).state(:,3)*180/pi;
fpaCargo3b = heavyorion_l_35.solution.phase(2).state(:,3)*180/pi;
fpaCargo4b = heavyorion_l_5.solution.phase(2).state(:,3)*180/pi;

sCargo1a    = (heavyorion_l_15.solution.phase(1).state(:,4))/1000;
sCargo2a    = (heavyorion_l_25.solution.phase(1).state(:,4))/1000;
sCargo3a   = (heavyorion_l_35.solution.phase(1).state(:,4))/1000;
sCargo4a   = (heavyorion_l_5.solution.phase(1).state(:,4))/1000;

sCargo1b    = (heavyorion_l_15.solution.phase(2).state(:,4))/1000;
sCargo2b    = (heavyorion_l_25.solution.phase(2).state(:,4))/1000;
sCargo3b   = (heavyorion_l_35.solution.phase(2).state(:,4))/1000;
sCargo4b   = (heavyorion_l_5.solution.phase(2).state(:,4))/1000;

mCargo1    = (heavyorion_l_15.solution.phase(2).state(:,5));
mCargo2    = (heavyorion_l_25.solution.phase(2).state(:,5));
mCargo3   = (heavyorion_l_35.solution.phase(2).state(:,5));
mCargo4    = (heavyorion_l_5.solution.phase(2).state(:,5));

bankCargo1 = acosd(heavyorion_l_15.solution.phase(1).control(:,1));
bankCargo2 = acosd(heavyorion_l_25.solution.phase(1).control(:,1));
bankCargo3 = acosd(heavyorion_l_35.solution.phase(1).control(:,1));
bankCargo4 = acosd(heavyorion_l_5.solution.phase(1).control(:,1));

thrustCargo1 = heavyorion_l_15.solution.phase(2).control(:,1)*100;
thrustCargo2 = heavyorion_l_25.solution.phase(2).control(:,1)*100;
thrustCargo3 = heavyorion_l_35.solution.phase(2).control(:,1)*100;
thrustCargo4 = heavyorion_l_5.solution.phase(2).control(:,1)*100;


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

p1 = plot(timeOrion1a, altOrion1a, 'Color', yellow, 'linewidth', 1.5);
p2 = plot(timeOrion1b, altOrion1b, 'Color', yellow, 'linewidth', 1.5);
p3 = plot(timeOrion2a, altOrion2a, 'Color', blue, 'linewidth', 1.5);
p4 = plot(timeOrion2b, altOrion2b, 'Color', blue, 'linewidth', 1.5);
p5 = plot(timeOrion3a, altOrion3a, 'Color', green, 'linewidth', 1.5);
p6 = plot(timeOrion3b, altOrion3b, 'Color', green, 'linewidth', 1.5);
p7 = plot(timeOrion4a, altOrion4a, 'Color', red, 'linewidth', 1.5);
p8 = plot(timeOrion4b, altOrion4b, 'Color', red, 'linewidth', 1.5);

p9 = plot(timeCargo1a, altCargo1a, '--', 'Color', yellow, 'linewidth', 1.5);
p10= plot(timeCargo1b, altCargo1b, '--', 'Color', yellow, 'linewidth', 1.5);
p11= plot(timeCargo2a, altCargo2a, '--', 'Color', blue, 'linewidth', 1.5);
p12= plot(timeCargo2b, altCargo2b, '--', 'Color', blue, 'linewidth', 1.5);
p13= plot(timeCargo3a, altCargo3a, '--', 'Color', green, 'linewidth', 1.5);
p14= plot(timeCargo3b, altCargo3b, '--', 'Color', green, 'linewidth', 1.5);
p15= plot(timeCargo4a, altCargo4a, '--', 'Color', red, 'linewidth', 1.5);
p16= plot(timeCargo4b, altCargo4b, '--', 'Color', red, 'linewidth', 1.5);


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Altitude~(km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend([p1, p3, p5, p7, p9, p11, p13, p15],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(2)
hold on;

p1 = plot(timeOrion1a, velOrion1a, 'Color', yellow, 'linewidth', 1.5);
p2 = plot(timeOrion1b, velOrion1b, 'Color', yellow, 'linewidth', 1.5);
p3 = plot(timeOrion2a, velOrion2a, 'Color', blue, 'linewidth', 1.5);
p4 = plot(timeOrion2b, velOrion2b, 'Color', blue, 'linewidth', 1.5);
p5 = plot(timeOrion3a, velOrion3a, 'Color', green, 'linewidth', 1.5);
p6 = plot(timeOrion3b, velOrion3b, 'Color', green, 'linewidth', 1.5);
p7 = plot(timeOrion4a, velOrion4a, 'Color', red, 'linewidth', 1.5);
p8 = plot(timeOrion4b, velOrion4b, 'Color', red, 'linewidth', 1.5);

p9 = plot(timeCargo1a, velCargo1a, '--', 'Color', yellow, 'linewidth', 1.5);
p10= plot(timeCargo1b, velCargo1b, '--', 'Color', yellow, 'linewidth', 1.5);
p11= plot(timeCargo2a, velCargo2a, '--', 'Color', blue, 'linewidth', 1.5);
p12= plot(timeCargo2b, velCargo2b, '--', 'Color', blue, 'linewidth', 1.5);
p13= plot(timeCargo3a, velCargo3a, '--', 'Color', green, 'linewidth', 1.5);
p14= plot(timeCargo3b, velCargo3b, '--', 'Color', green, 'linewidth', 1.5);
p15= plot(timeCargo4a, velCargo4a, '--', 'Color', red, 'linewidth', 1.5);
p16= plot(timeCargo4b, velCargo4b, '--', 'Color', red, 'linewidth', 1.5);


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Velocity (m/s)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend([p1, p3, p5, p7, p9, p11, p13, p15],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
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

p1 = plot(timeOrion1a, fpaOrion1a, 'Color', yellow, 'linewidth', 1.5);
p2 = plot(timeOrion1b, fpaOrion1b, 'Color', yellow, 'linewidth', 1.5);
p3 = plot(timeOrion2a, fpaOrion2a, 'Color', blue, 'linewidth', 1.5);
p4 = plot(timeOrion2b, fpaOrion2b, 'Color', blue, 'linewidth', 1.5);
p5 = plot(timeOrion3a, fpaOrion3a, 'Color', green, 'linewidth', 1.5);
p6 = plot(timeOrion3b, fpaOrion3b, 'Color', green, 'linewidth', 1.5);
p7 = plot(timeOrion4a, fpaOrion4a, 'Color', red, 'linewidth', 1.5);
p8 = plot(timeOrion4b, fpaOrion4b, 'Color', red, 'linewidth', 1.5);

p9 = plot(timeCargo1a, fpaCargo1a, '--', 'Color', yellow, 'linewidth', 1.5);
p10= plot(timeCargo1b, fpaCargo1b, '--', 'Color', yellow, 'linewidth', 1.5);
p11= plot(timeCargo2a, fpaCargo2a, '--', 'Color', blue, 'linewidth', 1.5);
p12= plot(timeCargo2b, fpaCargo2b, '--', 'Color', blue, 'linewidth', 1.5);
p13= plot(timeCargo3a, fpaCargo3a, '--', 'Color', green, 'linewidth', 1.5);
p14= plot(timeCargo3b, fpaCargo3b, '--', 'Color', green, 'linewidth', 1.5);
p15= plot(timeCargo4a, fpaCargo4a, '--', 'Color', red, 'linewidth', 1.5);
p16= plot(timeCargo4b, fpaCargo4b, '--', 'Color', red, 'linewidth', 1.5);


xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Flight Path Angle (deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend([p1, p3, p5, p7, p9, p11, p13, p15],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
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
hold on
p1 = plot(velOrion1a, altOrion1a, 'Color', yellow, 'linewidth', 1.5);
p2 = plot(velOrion1b, altOrion1b, 'Color', yellow, 'linewidth', 1.5);
p3 = plot(velOrion2a, altOrion2a, 'Color', blue, 'linewidth', 1.5);
p4 = plot(velOrion2b, altOrion2b, 'Color', blue, 'linewidth', 1.5);
p5 = plot(velOrion3a, altOrion3a, 'Color', green, 'linewidth', 1.5);
p6 = plot(velOrion3b, altOrion3b, 'Color', green, 'linewidth', 1.5);
p7 = plot(velOrion4a, altOrion4a, 'Color', red, 'linewidth', 1.5);
p8 = plot(velOrion4b, altOrion4b, 'Color', red, 'linewidth', 1.5);

p9 = plot(velCargo1a, altCargo1a, '--', 'Color', yellow, 'linewidth', 1.5);
p10= plot(velCargo1b, altCargo1b, '--', 'Color', yellow, 'linewidth', 1.5);
p11= plot(velCargo2a, altCargo2a, '--', 'Color', blue, 'linewidth', 1.5);
p12= plot(velCargo2b, altCargo2b, '--', 'Color', blue, 'linewidth', 1.5);
p13= plot(velCargo3a, altCargo3a, '--', 'Color', green, 'linewidth', 1.5);
p14= plot(velCargo3b, altCargo3b, '--', 'Color', green, 'linewidth', 1.5);
p15= plot(velCargo4a, altCargo4a, '--', 'Color', red, 'linewidth', 1.5);
p16= plot(velCargo4b, altCargo4b, '--', 'Color', red, 'linewidth', 1.5);


xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend([p1, p3, p5, p7, p9, p11, p13, p15],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%
figure(5)
hold on;

p1 = plot(timeOrion1a, bankOrion1, 'Color', yellow, 'linewidth', 1.5);
p3 = plot(timeOrion2a, bankOrion2, 'Color', blue, 'linewidth', 1.5);
p5 = plot(timeOrion3a, bankOrion3, 'Color', green, 'linewidth', 1.5);
p7 = plot(timeOrion4a, bankOrion4, 'Color', red, 'linewidth', 1.5);

p9 = plot(timeCargo1a, bankCargo1, '--', 'Color', yellow, 'linewidth', 1.5);
p11= plot(timeCargo2a, bankCargo2, '--', 'Color', blue, 'linewidth', 1.5);
p13= plot(timeCargo3a, bankCargo3, '-.', 'Color', green, 'linewidth', 1.5);
p15= plot(timeCargo4a, bankCargo4, '--', 'Color', red, 'linewidth', 1.5);

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Bank Angle (deg)','Interpreter','LaTeX');

set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
grid on

legend([p1, p3, p5, p7, p9, p11, p13, p15],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');
%%
figure(6)
hold on;

p2 = plot(timeOrion1b, thrustOrion1, 'Color', yellow, 'linewidth', 1.5);
p4 = plot(timeOrion2b, thrustOrion2, 'Color', blue, 'linewidth', 1.5);
p6 = plot(timeOrion3b, thrustOrion3, 'Color', green, 'linewidth', 1.5);
p8 = plot(timeOrion4b, thrustOrion4, 'Color', red, 'linewidth', 1.5);

p10= plot(timeCargo1b, thrustCargo1, '--', 'Color', yellow, 'linewidth', 1.5);
p12= plot(timeCargo2b, thrustCargo2, '--', 'Color', blue, 'linewidth', 1.5);
p14= plot(timeCargo3b, thrustCargo3, '--', 'Color', green, 'linewidth', 1.5);
p16= plot(timeCargo4b, thrustCargo4, '--', 'Color', red, 'linewidth', 1.5);
yl = ylabel('T (%)','Interpreter','LaTeX');
xl = xlabel('$t$~(s)','Interpreter','LaTeX');

set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);

grid on

legend([p2, p4, p6, p8, p10, p12, p14, p16],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png


%%
figure(6)
hold on;
plot(timeOrion1a, ones(size(timeOrion1a)).*mOrion1(1), 'Color', yellow, 'linewidth', 1.5);
p2 = plot(timeOrion1b, mOrion1, 'Color', yellow, 'linewidth', 1.5');
plot(timeOrion2a, ones(size(timeOrion2a)).*mOrion1(1), 'Color', blue, 'linewidth', 1.5);
p4 = plot(timeOrion2b, mOrion2, 'Color', blue,'linewidth', 1.5');
plot(timeOrion3a, ones(size(timeOrion3a)).*mOrion1(1), 'Color', green, 'linewidth', 1.5);
p6 = plot(timeOrion3b, mOrion3, 'Color', green,'linewidth', 1.5');
plot(timeOrion4a, ones(size(timeOrion4a)).*mOrion1(1), 'Color', red, 'linewidth', 1.5);
p8 = plot(timeOrion4b, mOrion4, 'Color', red,'linewidth', 1.5');

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

plot(timeCargo1a, ones(size(timeCargo1a)).*mCargo1(1), '--', 'Color', yellow, 'linewidth', 1.5);
p10= plot(timeCargo1b, mCargo1, '--', 'Color', yellow, 'linewidth', 1.5');
plot(timeCargo2a, ones(size(timeCargo2a)).*mCargo1(1), '--', 'Color', blue, 'linewidth', 1.5);
p12= plot(timeCargo2b, mCargo2, '--', 'Color', blue,'linewidth', 1.5');
plot(timeCargo3a, ones(size(timeCargo3a)).*mCargo1(1), '--', 'Color', green, 'linewidth', 1.5);
p14= plot(timeCargo3b, mCargo3, '--', 'Color', green,'linewidth', 1.5');
plot(timeCargo4a, ones(size(timeCargo4a)).*mCargo1(1), '--', 'Color', red, 'linewidth', 1.5);
p16= plot(timeCargo4b, mCargo4, '--', 'Color', red,'linewidth', 1.5');

xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Mass~(kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend([p10,p12,p14,p16], 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
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

%%
figure(8)
hold on
p1 = plot(velOrion1a./1000, altOrion1a, 'Color', yellow, 'linewidth', 1.5);
p2 = plot(velOrion1b./1000, altOrion1b, 'Color', yellow, 'linewidth', 1.5);
p3 = plot(velOrion2a./1000, altOrion2a, 'Color', blue, 'linewidth', 1.5);
p4 = plot(velOrion2b./1000, altOrion2b, 'Color', blue, 'linewidth', 1.5);
p5 = plot(velOrion3a./1000, altOrion3a, 'Color', green, 'linewidth', 1.5);
p6 = plot(velOrion3b./1000, altOrion3b, 'Color', green, 'linewidth', 1.5);
p7 = plot(velOrion4a./1000, altOrion4a, 'Color', red, 'linewidth', 1.5);
p8 = plot(velOrion4b./1000, altOrion4b, 'Color', red, 'linewidth', 1.5);

p9 = plot(velCargo1a./1000, altCargo1a, '--', 'Color', yellow, 'linewidth', 1.5);
p10= plot(velCargo1b./1000, altCargo1b, '--', 'Color', yellow, 'linewidth', 1.5);
p11= plot(velCargo2a./1000, altCargo2a, '--', 'Color', blue, 'linewidth', 1.5);
p12= plot(velCargo2b./1000, altCargo2b, '--', 'Color', blue, 'linewidth', 1.5);
p13= plot(velCargo3a./1000, altCargo3a, '--', 'Color', green, 'linewidth', 1.5);
p14= plot(velCargo3b./1000, altCargo3b, '--', 'Color', green, 'linewidth', 1.5);
p15= plot(velCargo4a./1000, altCargo4a, '--', 'Color', red, 'linewidth', 1.5);
p16= plot(velCargo4b./1000, altCargo4b, '--', 'Color', red, 'linewidth', 1.5);


xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
xlim([0,8]);
ylim([0,150]);
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png
legend([p1, p3, p5, p7, p9, p11, p13, p15],'Orion L/D = 0.15', 'Orion L/D = 0.25', 'Orion L/D = 0.35', ...
    'Orion L/D = 0.5', 'Cargo L/D = 0.15', 'Cargo L/D = 0.25', 'Cargo L/D = 0.35', ...
    'Cargo L/D = 0.5');

%%

mOrion = [mOrion1(end), mOrion2(end), mOrion3(end), mOrion4(end)];
mCargo = [mCargo1(end), mCargo2(end), mCargo3(end), mCargo4(end)];

PMF_Orion = 1 - mOrion./10400;
PMF_Cargo = 1 - mCargo./40000;
LD = [0.15, 0.25, 0.35, 0.5];
plot(LD, PMF_Orion*100, 'linewidth', 1.5);
hold on
plot(LD, PMF_Cargo*100, 'linewidth', 1.5);
xl = xlabel('L/D');
yl = ylabel('Propellant Mass Fraction (%)');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
legend('Orion EV', 'Cargo EV')



