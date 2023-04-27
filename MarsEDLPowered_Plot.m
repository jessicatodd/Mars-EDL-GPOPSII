%------------------------------%
% Extract Solution from Output %
%------------------------------%
solution     = output.result.solution;
time1        = solution.phase(1).time;
altitude1    = (solution.phase(1).state(:,1))/1000;
velocity1    = solution.phase(1).state(:,2)/1000;
fpa1         = solution.phase(1).state(:,3)*180/pi;
range1         = solution.phase(1).state(:,4)/1000;
bank         = acosd(solution.phase(1).control(:,1));

time2        = solution.phase(2).time;
altitude2    = (solution.phase(2).state(:,1))/1000;
velocity2    = solution.phase(2).state(:,2)/1000;
fpa2         = solution.phase(2).state(:,3)*180/pi;
range2         = solution.phase(2).state(:,4)/1000;
mass        = solution.phase(2).state(:,5);
thrust      = solution.phase(2).control(:,1);

%---------------%
% Plot Solution %
%---------------%
figure(1)
clf
hold on;
plot(time1,altitude1,'linewidth', 1.5);
plot(time2,altitude2,'linewidth', 1.5);    
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Altitude~(km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png

%%
figure(2)
clf
hold on;
plot(time1,velocity1*1000,'linewidth', 1.5);
plot(time2,velocity2*1000,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('$Velocity$~(m/s)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
grid on

%%
figure(3)
clf
hold on;
plot(time1,fpa1, 'linewidth', 1.5);
plot(time2,fpa2, 'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('$\gamma(t)$~(deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
grid on

%%
figure(4)
clf
hold on;
plot(velocity1*1000, altitude1, 'linewidth', 1.5);
plot(velocity2*1000, altitude2, 'linewidth', 1.5);
xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
grid on

%%
figure(5)
clf
plot(time1,bank,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Bank (^o)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
grid on

%%
figure(6)
clf
plot(time2,thrust,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('T (%)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
grid on

%%
figure(6)
hold on;
clf
yyaxis left;
plot(time1,bank,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('$\sigma(t)$ (deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
xlim([-5, 400]);
grid on

yyaxis right
plot(time2,thrust*100,'linewidth', 1.5);
yl = ylabel('T (%)','Interpreter','LaTeX');


%%
figure(7)
clf
hold on;
plot(time1, ones(size(time1)).*mass(1), 'linewidth', 1.5);
plot(time2, mass, 'linewidth', 1.5);
xl = xlabel('time (s)','Interpreter','LaTeX');
yl = ylabel('Mass (kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
grid on


%%
figure(8)
clf
plot(time1, abs(range1), 'linewidth', 1.5)
hold on
plot(time2,abs(range2), 'linewidth', 1.5)
xl = xlabel('time (s)','Interpreter','LaTeX');
yl = ylabel('Range (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);

%%
figure(9)
clf
hold on;
plot(velocity1, altitude1, 'linewidth', 1.5);
plot(velocity2, altitude2, 'linewidth', 1.5);
xl = xlabel('Velocity (km/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(gca, 'YTick', (0:25:150));
ylim([0, 150]);
xlim([0, 8]);
grid on

