%------------------------------%
% Extract Solution from Output %
%------------------------------%
solution    = output.result.solution;
time        = solution.phase.time;
altitude    = (solution.phase(1).state(:,1))/1000;
velocity    = solution.phase(1).state(:,2)/1000;
fpa         = solution.phase(1).state(:,3)*180/pi;
mass        = solution.phase(1).state(:,5);
thrust      = solution.phase(1).control(:,1);

%---------------%
% Plot Solution %
%---------------%
figure(1)
hold on;
pp = plot(time,altitude,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Altitude~(km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(pp,'LineWidth',1.25);
grid on
% print -depsc2 rlvEntryAltitude.eps
% print -dpng rlvEntryAltitude.png

%%
figure(2)
hold on;
pp = plot(time,velocity*1000,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('$Velocity$~(m/s)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(pp,'LineWidth',1.25);
grid on

%%
figure(3)
hold on;
plot(time,fpa, 'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('$\gamma(t)$~(deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on

%%
figure(4)
plot(velocity*1000, altitude, 'linewidth', 1.5);
xl = xlabel('Velocity (m/s)','Interpreter','LaTeX');
yl = ylabel('Altitude (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on

%%
figure(6)
plot(time,thrust,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('T (%)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on



%%
figure(7)
plot(time, mass, 'linewidth', 1.5);
xl = xlabel('time (s)','Interpreter','LaTeX');
yl = ylabel('Mass (kg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on

