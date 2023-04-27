%------------------------------%
% Extract Solution from Output %
%------------------------------%
solution    = output.result.solution;
time        = solution.phase(1).time;
altitude    = (solution.phase(1).state(:,1))/1000;
velocity    = solution.phase(1).state(:,2)/1000;
fpa         = solution.phase(1).state(:,3)*180/pi;
s           = solution.phase(1).state(:,4)/1000;


bank      = acosd(solution.phase(1).control(:,1));

%---------------%
% Plot Solution %
%---------------%
figure(1)
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
plot(time,velocity*1000,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Velocity~(m/s)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(pp,'LineWidth',1.25);
grid on

%%
figure(4)
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
figure(7)
grid on
plot(time,bank,'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('$\sigma(t)$~(deg)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on

%%
figure(8)
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
figure(9)
plot(time, s, 'linewidth', 1.5);
xl = xlabel('$t$~(s)','Interpreter','LaTeX');
yl = ylabel('Downrange Distance (km)','Interpreter','LaTeX');
set(xl,'FontSize',18);
set(yl,'FontSize',18);
set(gca,'FontSize',16,'FontName','Times');
set(gca,'FontSize',16);
set(pp,'LineWidth',1.25);
grid on

